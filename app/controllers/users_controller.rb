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
    @rant = Rant.new
    @rants = Rant.find(params[:id])



  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.bio = params[:user][:bio]
    @user.save
    redirect_to user_path

  end


end