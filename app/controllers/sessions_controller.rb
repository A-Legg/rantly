class SessionsController < ApplicationController

  def new
    @user = Users.new

  end

  def create
    @user = Users.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        @user = Users.new(username: params[:user][:username])
        @user.errors[:base] << "Username/Password is invalid"
        render signin_path
      end

  end

end