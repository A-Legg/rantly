class AdminController < ApplicationController
  before_filter :admin

  def disable
    @user = User.find(params[:id])
    @user.update_attribute(:disabled, true)
    redirect_to :back
  end

  def enable
    @user = User.find(params[:id])
    @user.update_attribute(:disabled, false)
    redirect_to :back
  end

  def impersonate
    session[:user_id] = params[:user_id]
    redirect_to dashboard_path(params[:user_id])
  end

  def unimpersonate
    session.delete(:user_id)
    redirect_to admin_rants_path
  end

end