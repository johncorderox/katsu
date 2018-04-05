class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :bio, :gender, :birthday)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :current_password, :bio, :gender, :birthday)}
  end

  def after_sign_up_path_for(resource)
    moods_path
  end

  def after_sign_in_path_for(resource)
    moods_path
  end

end
