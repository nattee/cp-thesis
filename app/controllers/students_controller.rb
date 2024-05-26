class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy
                                        act_proposal act_exam
                                      ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # main action
  def act_proposal
    if @student.has_active_proposal
      redirect_to edit_proposal_path(@student.proposals.last)
    else
      redirect_to new_proposal_path
    end
  end

  def act_exam
    if @student.has_active_exam
      redirect_to exams_path, notice: 'มีการนัดสอบแล้ว ตรวจสอบผลการนัดสอบจากรายการด้านล่าง'
    elsif @student.has_active_proposal
      redirect_to new_exam_path
    else
      redirect_to new_proposal_path
    end

  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:cuid, :name, :program)
    end
end
