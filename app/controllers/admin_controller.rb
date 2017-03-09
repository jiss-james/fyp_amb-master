class AdminController < ApplicationController

  #before any action in this controller check if they are an admin
  before_filter :check_if_admin

  def index
  end

  protected
  def check_if_admin
    #checks if the person is an admin, if not redirects back to root_url
    if !current_user.admin?
      flash[:alert] = 'Only Admins allowed!'
      redirect_to root_url
    end
  end

end
