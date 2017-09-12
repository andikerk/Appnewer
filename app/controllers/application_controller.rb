class ApplicationController < ActionController::Base
	

before_action :set_cache_headers

  private
# disable back-forth caching for  views for other users
  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
   # response.headers["Pragma"] = "no-cache"
   # response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
#------------------------------------------------------
 	 protect_from_forgery with: :exception


	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to main_app.root_url, alert: exception.message
	end
  
	  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # saves the location before loading each page so we can return to the
  # right page. If we're on a devise page, we don't want to store that as the
  # place to return to (for example, we don't want to return to the sign in page
  # after signing in), which is what the :unless prevents
  before_action :store_current_location, :unless => :devise_controller?

  private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end
end


