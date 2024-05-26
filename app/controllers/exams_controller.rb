class ExamsController < ApplicationController
  before_action :set_exam, only: %i[ show edit update destroy
                                     download_exam download_invitation approve update_approve
                                   ]

  # GET /exams or /exams.json
  def index
    if current_user.role_staff?
      @exams = Exam.all
    elsif current_user.role_faculty?
      @exams = Exam.all
      render :index_faculty
    else
      @exams = Exam.joins(:proposal).where('proposals.student': current_user.student)
      render :index_student
    end
  end

  # GET /exams/1 or /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
    if current_user.student
      @exam.proposal = current_user.student.proposals.last
    end
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams or /exams.json
  def create
    @exam = Exam.new(exam_params)
    if current_user.role_student?
      @exam.proposal = current_user.student.proposals.last
      target = root_path
    else
      target = exams_path
    end

    respond_to do |format|
      if @exam.save
        format.html do
          if current_user.role_student?
            redirect_to root_path, notice: "สร้างการนัดหมายการสอบเรียบร้อย"
          else
            redirect_to exams_path, notice: "สร้างการนัดหมายการสอบเรียบร้อย"
          end

        end
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to exam_url(@exam), notice: "Exam was successfully updated." }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam.destroy!

    respond_to do |format|
      format.html { redirect_to exams_url, notice: "Exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download_exam
    filename = "exam.docx"
    send_file @exam.gen_docx_exam, type: 'application/docx', disposition: 'inline', filename: filename
  end

  def download_invitation
    filename = "invitation.docx"
    send_file @exam.gen_docx_invitation(@exam.ex_com), type: 'application/docx', disposition: 'inline', filename: filename
  end

  def approve
  end

  def update_approve
    @exam.update(advisor_approved: params[:approve])
    if @exam.advisor_approved?
      redirect_to exams_path, notice: "อนุมัติสอบโครงร่างของ #{@exam.proposal.student.name} เรียบร้อย"
    else
      redirect_to exams_path, notice: "ปฏิเสธการสอบโครงร่างของ #{@exam.proposal.student.name}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:proposal_id, :exam_date, :place, :chair, :com1, :com2, :com3, :ex_com)
    end
end
