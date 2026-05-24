class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:bio, :location])
  end

  def require_user
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You must be logged in to perform this action."
    end
  end

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "You must be an admin to perform this action."
    end
  end
end
