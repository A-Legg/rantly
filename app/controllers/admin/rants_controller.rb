class Admin::RantsController < AdminController
  before_filter :admin

  def index
    if params[:start_date].present? && params[:end_date].present?
    @rants = Rant.where(created_at: params[:start_date]..params[:end_date])
    elsif !params[:start_date].present? && params[:end_date].present?
      @rants = Rant.where(["created_at < ?", params[:end_date]])
    elsif params[:start_date].present? && !params[:end_date].present?
      @rants = Rant.where(["created_at > ?", params[:start_date]])
    else
      @rants = Rant.all.order("created_at DESC")
    end
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