class SessionsController < ApplicationController
	layout 'login_layout'
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]="Login Successfully"
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Email or password is not correct"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success]="Logout Successfully"
    redirect_to login_path
  end
end
