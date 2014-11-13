class Admin::DashboardController < AdminController
  before_filter :admin

  def show
    @user = User.find(params[:id])
    @logins = Keen.event_collections
  end


end