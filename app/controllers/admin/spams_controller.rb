class Admin::SpamsController < AdminController
  before_filter :admin

  def index

    if params[:start_date].present? && params[:end_date].present?
      @spams = Spam.where(created_at: params[:start_date]..params[:end_date])
    elsif !params[:start_date].present? && params[:end_date].present?
      @spams = Spam.where(["created_at < ?", params[:end_date]])
    elsif params[:start_date].present? && !params[:end_date].present?
      @spams = Spam.where(["created_at > ?", params[:start_date]])
    else
      @spams = Spam.all.order("created_at DESC")
    end

  end




  def destroy
    @spam = Spam.find_by(params[:spam_id])
    @spam.destroy
    render :back
  end
end