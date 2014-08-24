class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password_digest = params[:user][:password]
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.bio = params[:user][:bio]



    if @user.save
      flash[:notice] = 'You have registered successfully!'
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else redirect_to '/users/new'
    end


  end

  def show
    @user = User.find(params[:id])

  end


end