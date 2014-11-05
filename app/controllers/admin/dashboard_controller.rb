class Admin::DashboardController < AdminController
  before_filter :admin

  def show
    @user = User.find(params[:id])

  end


end