class Admin::SpamsController < AdminController
  before_filter :admin

  def index
    @spams = Spam.where(created_at: params[:start_date]..params[:end_date])

  end

  def destroy
    @spam = Spam.find_by(params[:spam_id])
    @spam.destroy
    redirect_to admin_rants_path
  end
end