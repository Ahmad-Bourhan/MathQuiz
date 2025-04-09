class ApplicationController < ActionController::Base
  skip_forgery_protection
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: "You must be logged in to access this page."
    end
  end
end
