class ProposalsController < ApplicationController
  before_action :set_proposal, only: %i[ show edit update destroy
                                         download
                                       ]

  # GET /proposals or /proposals.json
  def index
    if current_user.role_student?
      @proposals = Proposal.where(student: current_user.student)
    elsif current_user.role_faculty?
      @proposals = Proposal.where(advisor: current_user.faculty)
    else
      @proposals = Proposal.all
    end
  end

  # GET /proposals/1 or /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
    @proposal.student = Student.first
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals or /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to proposal_url(@proposal), notice: "Proposal was successfully created." }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1 or /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to proposal_url(@proposal), notice: "Proposal was successfully updated." }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1 or /proposals/1.json
  def destroy
    @proposal.destroy!

    respond_to do |format|
      format.html { redirect_to proposals_url, notice: "Proposal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download
    filename = "โครงร่าง_#{@proposal.student.name}"
    data = @proposal.file.download
    send_data data, type: 'application/pdf',  disposition: 'inline', filename: filename
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proposal_params
      params.require(:proposal).permit(:student_id, :name_th, :name_en, :advisor_id, :file)
    end
end
