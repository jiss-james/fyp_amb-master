class ActivitiesController < ApplicationController

  #before doing any action we will see if the user is logged in
  before_action :authenticate_user!
  #finds the related company
  before_action :set_company
  #sets up cancancan abilities
  load_and_authorize_resource

  # GET /activities
  # GET /activities.json
  def index
    # redirects to company page, because it already lists all the associated activities
    redirect_to @company
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    #finds the activity with the id
    @activity = @company.activities.find(params[:id])
    #finds the associated user
    @user = User.find(@company.user_id)
  end

  # GET /activities/new
  def new
    @activity = @company.activities.new
  end

  # GET /activities/1/edit
  def edit
    @activity =  @company.activities.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity =  @company.activities.build(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to company_activity_path @company, @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    @activity =  @company.activities.find(params[:id])

    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to company_activity_path @company, @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = @company.activities.find(params[:id])

    @activity.destroy
    respond_to do |format|
      format.html { redirect_to company_activities_path @company, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
			@company = Company.find(params[:company_id])
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      #these parametes are required before it can be saved.
      params.require(:activity).permit(:activity_name, :description, :start_date, :end_date, :location, :vehicle, :mobile, :telephone, :image)
    end
end
