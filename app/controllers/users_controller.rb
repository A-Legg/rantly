class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have registered successfully!'
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      render '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])

    @rant = Rant.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to dashboard_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency, :avatar)
  end

end