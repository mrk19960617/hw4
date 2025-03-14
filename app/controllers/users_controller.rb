class UsersController < ApplicationController
  def new
    @user = User.new  # Initialize a new user for the signup form
  end

  def create
    @user = User.new(user_params)  # Create a new user from form params

    if @user.save  # Save the user if valid
      flash[:notice] = "Thanks for signing up. Now login."
      redirect_to "/login"  # Redirect to login page
    else
      render :new  # If save fails, render signup form again
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
