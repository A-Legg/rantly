class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :admin

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else

    end
  end
  helper_method :current_user

  def admin
    if @user && @user.admin
      true
    else
      false
    end
  end
  helper_method :admin

  def confirmed
    if @user && @user.confirmed
      true
    else
      false
    end
  end
end
