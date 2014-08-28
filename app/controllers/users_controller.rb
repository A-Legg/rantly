class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      password: params[:user][:password],
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      bio: params[:user][:bio]
    )


    if @user.save
      flash[:notice] = 'You have registered successfully!'
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      render '/users/new'
    end


  end

  def show
    @user = User.find(params[:id])

  end


end