class WelcomeController < ApplicationController

  def show
    if cookies[:visitor]
      flash.now[:notice] = "Welcome back! Please consider registering to begin your ranting!"
      render :show
    else
      render :show
    end
  end
end


