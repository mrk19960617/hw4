class SessionsController < ApplicationController
  def new
    # Your login form view
  end

  def create
    @user = User.find_by(email: params["email"])

    if @user && @user.authenticate(params["password"])
      session[:user_id] = @user.id
      redirect_to "/places"
    else
      flash[:notice] = "Invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil  # This will log the user out by clearing the session
    flash[:notice] = "Logged out successfully."
    redirect_to "/login"   # Redirect to login page
  end
end
