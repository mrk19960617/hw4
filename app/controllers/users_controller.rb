class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["first_name"] = params["first_name"]
    @user["last_name"] = params["last_name"]
    @user["email"] = params["email"]
    @user["password"] = params["password"]
    @user["password_confirmation"] = params["password_confirmation"]
    @user.save

    session[:user_id] = @user.id  # logs in the user

    redirect_to "/places"
  end
end
