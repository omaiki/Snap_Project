class UsersController < ApplicationController

#new user instance
  def new
    @user = User.new
  end

#save the user to the database, redisplay form if validation errors
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
