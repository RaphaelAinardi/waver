class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
  end

  def user_root_path
    dashboard_path
  end

  def after_sign_in_path(resources)
    spots_path
  end

  def after_sign_out_path_for(resources)
    spots_path
  end
end
