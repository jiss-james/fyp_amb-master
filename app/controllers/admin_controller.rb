class AdminController < ApplicationController

  before_filter :check_if_admin
  
  def index
  end

  protected
  def check_if_admin
    if !current_user.admin?
      flash[:alert] = 'Only Admins allowed!'
      redirect_to root_url
    end
  end

end
