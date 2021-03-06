class UsersController < ApplicationController

  before_action :authenticate_user!
  before_filter :check_if_admin, only: [:index, :destroy]


  def index
     @users = User.all
  end

  def show
    @user = User.find(params[:id])
    today = Date.today
    d = Date.new(today.year, @user.date_of_birth.month, @user.date_of_birth.day)
    @age = d.year - @user.date_of_birth.year - (d > today ? 1 : 0)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def check_if_admin
    if !current_user.admin?
      flash[:alert] = 'Only Admins allowed!'
      redirect_to root_url
    end
  end


end
