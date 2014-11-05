class Admin::UsersController < AdminController
  before_filter :admin

  def index
  @user = current_user
   @users = User.all
  end
end