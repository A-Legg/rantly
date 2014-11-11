class Admin::RantsController < AdminController
  before_filter :admin

  def index
    @user = current_user
    if params[:spam]
      @rants = Rant.all.where(:spam => true)
    end
    @rants = Rant.all.order("created_at DESC")
  end

  def destroy
    @rant = Rant.find_by(params[:rant_id])
    @rant.destroy
    redirect_to admin_rants_path
  end


end