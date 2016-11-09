class SessionsController < ApplicationController

  def new
  end

#create action, where authentication happens
  def create
    user = User.find_by_email(params[:email])
# check if user was found matching email and if password matches, call authenticate from has_secure_password
    if user && user.authenticate(params[:password])
      # if it does, store in session
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    #clear out session
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
