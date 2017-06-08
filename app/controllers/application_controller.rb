class ApplicationController < ActionController::Base
	

before_filter :set_cache_headers

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

 	 protect_from_forgery with: :exception


	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to main_app.root_url, alert: exception.message
	end
	  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end


