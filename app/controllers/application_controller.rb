class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    if current_user.email == User::TEMP_EMAIL
      edit_user_registration_path
    else
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "Access denied. You are not authorized for this action. If you feel you have reached this in error, please contact the admin."
    redirect_to (request.referrer || '/' )
  end

before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :self_intro)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :self_intro)
    end
  end

end
