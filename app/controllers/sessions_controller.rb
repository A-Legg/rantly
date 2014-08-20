class SessionsController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.find_by(username: params[:user][:username])
      # if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        @user = User.new(username: params[:user][:username])
        @user.errors[:base] << "Username/Password is invalid"
        render signin_path
      end

  end
