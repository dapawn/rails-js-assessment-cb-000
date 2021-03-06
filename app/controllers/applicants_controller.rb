class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  # GET /applicants
  def index
    @applicants = Applicant.all
    render layout: false
  end

  # GET /applicants/1
  def show
    @assets = Asset.where(applicant_id: @applicant.id)
    @household_members = HouseholdMember.where(applicant_id: @applicant.id)
    @requests = Request.where(applicant_id: @applicant.id)
    render layout: false
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
    render layout: false
  end

  # GET /applicants/1/edit
  def edit
    render layout: false
  end

  # POST /applicants
  def create
    @applicant = Applicant.new(applicant_params)
    @asset = Asset.new(applicant_id: @applicant.id)

    if @applicant.save
	    render "assets/index", applicant: @applicant, asset: @asset, layout: false
    else
	    render :new, layout: false
    end
  end

  # PATCH/PUT /applicants/1
  def update
    if @applicant.update(applicant_params)
      @assets = Asset.where(applicant_id: @applicant.id)
      @household_members = HouseholdMember.where(applicant_id: @applicant.id)
      @requests = Request.where(applicant_id: @applicant.id)
      render :show, notice: 'Applicant was successfully updated.', layout: false
      #redirect_to @applicant, notice: 'Applicant was successfully updated.'
    else
      render :edit, layout: false
    end
  end

  # DELETE /applicants/1
  def destroy
    if @requests = Request.where(applicant_id: @applicant.id)
      Array(@requests).each do |request|
        request.destroy
      end
    end
    if @assets = Asset.where(applicant_id: @applicant.id)
      Array(@assets).each do |asset|
        asset.destroy
      end
    end
    if @household_members = HouseholdMember.where(applicant_id: @applicant.id)
      Array(@household_members).each do |household_member|
        household_member.destroy
      end
    end
    @applicant.destroy
    render "churches/show", notice: 'Applicant was successfully deleted.'
    #redirect_to applicants_url, notice: 'Applicant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_params
      params.require(:applicant).permit(:fname, :lname, :address, :gender, :dob, :phone, :married_status, :household_id, :apllicant_assets_id, :house_id, :church_id, :applicant_requests_id, :occupation, :occupation_status, :income)
    end
end
