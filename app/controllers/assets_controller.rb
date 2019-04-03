class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :set_applicant

  # GET /assets
  def index
    @assets = Asset.where(applicant_id: params[:applicant_id])
    #@assets = Asset.all
#raise @assets.inspect
  end

  # GET /assets/1
  def show
  end

  # GET /assets/new
  def new
    @asset = Asset.new(applicant_id: params[:applicant_id])
  end

  # GET /assets/1/edit
  def edit
  end

  # POST /assets
  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      redirect_to applicant_assets_url, notice: 'Asset was successfully created.'
      #redirect_to [@applicant, @asset], notice: 'Asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /assets/1
  def update
    if @asset.update(asset_params)
      redirect_to applicant_asset_path(@applicant, @asset), notice: 'Asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assets/1
  def destroy
    @asset.destroy
    redirect_to applicant_assets_url, notice: 'Asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    def set_applicant
      @applicant = Applicant.find(params[:applicant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:description, :value, :applicant_id)
    end
end
