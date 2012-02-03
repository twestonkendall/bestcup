class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end 

  helper_method :current_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
