class Admin::RantsController < AdminController
  before_filter :admin

  def index
    @user = current_user
    @rants = Rant.all.order("created_at DESC")
  end
end