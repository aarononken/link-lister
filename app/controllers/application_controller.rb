class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:bio, :location])
  end

  def require_user
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You must be signed in to do that."
    end
  end

  def require_admin
    unless user_signed_in? && current_user.respond_to?(:admin?) && current_user.admin?
      redirect_to root_path, alert: "Not authorized."
    end
  end
end
