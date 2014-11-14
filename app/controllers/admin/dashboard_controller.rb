class Admin::DashboardController < AdminController
  before_filter :admin

  def show
    @user = User.find(params[:id])
    @logins = Keen.query("count", "logins", :timeframe => "today", :group_by => "created_at", :interval => "hourly")
  end


end
