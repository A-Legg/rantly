class AdminController < ApplicationController
  before_filter :admin

  def admin
    if @user && @user.admin
      true
    else
      false
    end
  end
  helper_method :admin

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else

    end
  end
  helper_method :current_user



end