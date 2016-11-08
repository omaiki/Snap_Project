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

  def show
     @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
    render :edit
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: "User has been updated."
    else
      render "edit"
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
