class WelcomeController < ApplicationController

  def show

    if flash.empty? && session.delete(:visited)
      flash.now[:notice] = "Welcome back! Please consider registering to begin your ranting!"
    else
      session[:visited] = true
    end
  end
end




