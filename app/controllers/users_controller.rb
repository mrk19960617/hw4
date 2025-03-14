class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = "Thanks for signing up. Now login."
      redirect_to "/login"
    else
      render :new  # If the save fails, re-render the signup form
    end
  end

  private

  def user_params
    # Ensure you permit the user object as a whole
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
