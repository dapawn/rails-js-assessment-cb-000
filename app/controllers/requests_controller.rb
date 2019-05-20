class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_applicant

  # GET /requests
  def index
    @requests = Request.where(applicant_id: params[:applicant_id])
    #@requests = Request.all
    render layout: false
  end

  # GET /requests/1
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new(applicant_id: params[:applicant_id])
    render layout: false
  end

  # GET /requests/1/edit
  def edit
    render layout: false
  end

  # POST /requests
  def create
    @request = Request.new(request_params)


    if @request.save
      @requests = Request.where(applicant_id: params[:applicant_id])
      #@assets = Asset.where(applicant_id: @applicant.id)
      #@household_members = HouseholdMember.where(applicant_id: @applicant.id)
      #render 'applicants/show', notice: 'Request was successfully submitted. Please review, and make changes if needed.', layout: false
      render "requests/_index.html.erb", applicant: @applicant, request: @request, layout: false
    else
	    alert('Save did not work, try again');
      render :new, layout: false
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      @requests = Request.where(applicant_id: @applicant.id)
      render "requests/_index.html.erb", applicant: @applicant, request: @request, layout: false
    else
      render :edit, layout: false
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
    #@assets = Asset.where(applicant_id: @applicant.id)
    #@household_members = HouseholdMember.where(applicant_id: @applicant.id)
    #@requests = Request.where(applicant_id: @applicant.id)
    #render :show, notice: 'Request was successfully deleted.', layout: false
    #redirect_to applicant_requests_url, notice: 'Request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    def set_applicant
      @applicant = Applicant.find(params[:applicant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:item, :cost, :availability, :business, :benefit, :why, :recommendation, :applicant_id)
    end
end
