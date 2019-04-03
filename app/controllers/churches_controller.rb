class ChurchesController < ApplicationController
  before_action :set_church, only: [:show, :edit, :update, :destroy]

  # GET /churches
  def index
    @churches = Church.all
  end

  # GET /churches/1
  def show
    @applicants = @church.applicants
  end

  # GET /churches/new
  def new
    @church = Church.new
  end

  # GET /churches/1/edit
  def edit
  end

  # POST /churches
  def create
    @church = Church.new(church_params)

    if @church.save
      redirect_to @church, notice: 'Church was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /churches/1
  def update
      if @church.update(church_params)
        redirect_to @church, notice: 'Church was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /churches/1
  def destroy
    @church.destroy
    redirect_to churches_url, notice: 'Church was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_church
      @church = Church.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def church_params
      params.require(:church).permit(:city, :country, :minister)
    end
end
