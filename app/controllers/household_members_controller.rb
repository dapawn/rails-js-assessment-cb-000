class HouseholdMembersController < ApplicationController
  before_action :set_household_member, only: [:show, :edit, :update, :destroy]
  before_action :set_applicant

  # GET /household_members
  def index
    @household_members = HouseholdMember.where(applicant_id: params[:applicant_id])
    #@household_members = HouseholdMember.all
  end

  # GET /household_members/1
  def show
  end

  # GET /household_members/new
  def new
    @household_member = HouseholdMember.new(applicant_id: params[:applicant_id])
  end

  # GET /household_members/1/edit
  def edit
  end

  # POST /household_members
  def create
    @household_member = HouseholdMember.new(household_member_params)

    if @household_member.save
      redirect_to applicant_household_members_url, notice: 'Household member was successfully created.'
      #redirect_to @household_member, notice: 'Household member was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /household_members/1
  def update
    if @household_member.update(household_member_params)
      redirect_to applicant_household_members_path(@applicant), notice: 'Household member was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /household_members/1
  def destroy
    @household_member.destroy
    redirect_to applicant_household_members_url, notice: 'Household member was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household_member
      @household_member = HouseholdMember.find(params[:id])
    end

    def set_applicant
      @applicant = Applicant.find(params[:applicant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def household_member_params
      params.require(:household_member).permit(:name, :age, :relation, :applicant_id)
    end
end
