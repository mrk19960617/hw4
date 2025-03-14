# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params["email"])  # Using email for login
    if @user && @user.authenticate(params["password"])
      session[:user_id] = @user.id
      redirect_to "/places"
    else
      flash[:notice] = "Invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil  # This clears the session, logging the user out
    flash[:notice] = "Logged out successfully."
    redirect_to "/login"  # Redirect to login page after logout
  end
end
