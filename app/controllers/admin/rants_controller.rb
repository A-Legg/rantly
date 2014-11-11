class Admin::RantsController < AdminController
  before_filter :admin

  def index
    @user = current_user
    @rants = Rant.all.order("created_at DESC")
  end

  def destroy
    @rant = Rant.find_by(params[:rant_id])
    @rant.destroy
    redirect_to admin_rants_path
  end


end