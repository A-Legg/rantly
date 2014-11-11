class Admin::UsersController < AdminController
  before_filter :admin

  def index
    @user = current_user
    if params[:sort]
      @users  = User.all.sort_by { |user| user.rants.count }.reverse
    else
      @users = User.all
    end
  end

  def update
    @user = User.find_by(params[:user_id])
  end


end