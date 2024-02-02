class ApplicationController < ActionController::Base
  before_action :configure_params, if: :devise_controller?
  
  private
  def configure_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
