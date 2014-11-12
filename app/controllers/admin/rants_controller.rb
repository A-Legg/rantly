class Admin::RantsController < AdminController
  before_filter :admin

  def index
    @rants = Rant.where(created_at: params[:start_date]..params[:end_date])
  end

  def show
    @rant = Rant.find(params[:id])
  end

  def destroy
    @rant = Rant.find_by(params[:rant_id])
    @rant.destroy
    redirect_to admin_rants_path
  end






end