class ApplicationController < ActionController::Base
  helper_method :current_user

  # Method to check if user is logged in
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # This method will redirect to login page if user is not logged in
  def require_login
    redirect_to "/login" unless current_user
  end
end
