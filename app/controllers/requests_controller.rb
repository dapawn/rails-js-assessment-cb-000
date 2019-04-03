class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_applicant

  # GET /requests
  def index
    @requests = Request.where(applicant_id: params[:applicant_id])
    #@requests = Request.all
  end

  # GET /requests/1
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new(applicant_id: params[:applicant_id])
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  def create
    @request = Request.new(request_params)

    if @request.save
	    redirect_to applicant_url(@applicant), notice: 'Request was successfully submitted. Please review, and make changes if needed.'
    else
      render :new
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      redirect_to applicant_request_path(@applicant, @request), notice: 'Request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
    redirect_to applicant_requests_url, notice: 'Request was successfully destroyed.'
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
      params.require(:request).permit(:item, :cost, :availability, :business, :benefit, :why, :recommentdation, :applicant_id)
    end
end
