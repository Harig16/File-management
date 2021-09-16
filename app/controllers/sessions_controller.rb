class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      #action
      log_in(@user)
      #remember(@user)
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      flash[:info] = "Logged in successfully!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid username and password."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
