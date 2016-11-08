class UsersController < ApplicationController

#new user instance
  def new
    @user = User.new
  end

#save the user to the database, redisplay form if validation errors
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render 'new'
    end
  end

end
