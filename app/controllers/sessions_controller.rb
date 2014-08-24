class SessionsController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.find_by(username: params[:username])
      # if @user && @user.authenticate(params[:user][:password])

    redirect_to "/users/#{session[:user_id]}"
      # else
      #   @user = User.new(username: params[:user][:username])
      #   @user.errors[:base] << "Username/Password is invalid"
      #   render signin_path
      # end

  end

  def destroy
    session.destroy
    redirect_to signin_path

  end
end
