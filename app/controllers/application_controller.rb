class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:mobile_number, :carrier, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:mobile_number, :carrier, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:mobile_number, :carrier, :email, :password, :current_password) }
  end

end
