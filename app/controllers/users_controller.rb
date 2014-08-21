class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(
      username: params[:username],
      password_digest: params[:password_digest],
      first_name: params[:first_name],
      last_name: params[:last_name],
      bio: params[:bio]
    )

    @user.save
      redirect_to '/users'


  end


end