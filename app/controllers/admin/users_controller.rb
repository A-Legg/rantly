class Admin::UsersController < AdminController
  before_filter :admin

  def index
    @user = current_user
    @users = User.all
  end

  def update
    @user = User.find_by(params[:user_id])


  end






end