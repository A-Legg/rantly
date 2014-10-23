class RantsController < ApplicationController


  def show
    @user = current_user
    @rant = Rant.find(params[:id])
  end

  def new
    @rant = Rant.new
  end

  def create
    @rant = Rant.new(rant_params)
    @rant.user_id = current_user.id
    if @rant.save
      redirect_to dashboard_path(current_user)
    else
      @rant.errors
      render dashboard_path(current_user)
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to dashboard_path(session[:user_id])
  end


  private

  def rant_params
    params.require(:rant).permit(:rant, :description)
  end
end