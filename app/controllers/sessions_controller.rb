class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password]) && @user.admin
      session[:user_id] = @user.id
      redirect_to admin_rants_path
    elsif
     @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user.id)
    elsif
      flash[:notice] = "Login failed."
      redirect_to signin_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
