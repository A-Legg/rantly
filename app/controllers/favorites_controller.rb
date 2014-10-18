class FavoritesController < ApplicationController

  def create
    Favorite.create!(favorite_params)

    redirect_to dashboard_path(current_user)
  end

  def destroy
    Favorite.destroy(params[:id])

    redirect_to dashboard_path(current_user)
  end

  def index
    @user = current_user
  end

  private

  def favorite_params
    params.permit(:rant_id).merge({user_id: current_user.id})
  end
end
