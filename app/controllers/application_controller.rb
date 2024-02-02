class ApplicationController < ActionController::Base
  before_action :configure_params, if: :devise_controller?
  

  def authenticate_admin_user!
    authenticate_user!
    redirect_to root_path unless current_user.has_role?(:admin)  
  end
  private
  def configure_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


end
