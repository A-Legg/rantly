class Admin::SpamsController < AdminController

  def index
    @spams = Spam.all
  end

  def destroy
    @spam = Spam.find_by(params[:spam_id])
    @spam.destroy
    redirect_to admin_rants_path
  end
end