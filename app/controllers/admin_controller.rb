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

end