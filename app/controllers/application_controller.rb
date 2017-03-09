class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #these parameters are need on registration
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :date_of_birth])
    #these parameters are need on account update
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :date_of_birth, :gender, :profession, :description, :work_experience, :current_location, :vehicle, :available_for_work, :image, :mobile, :telephone])
  end

end
