class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params["email"])  # Using email for login
    if @user && @user.authenticate(params["password"])
      session[:user_id] = @user.id  # Assign user ID to session for login
      redirect_to "/places"  # Redirect to places index page
    else
      flash[:notice] = "Invalid email or password."  # If login fails
      redirect_to "/login"  # Redirect back to login
    end
  end

  def destroy
    session[:user_id] = nil  # This will log the user out by clearing the session
    flash[:notice] = "Logged out successfully."
    redirect_to "/login"  # Redirect to login page after logout
  end
end
