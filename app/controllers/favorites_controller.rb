class FavoritesController < ApplicationController

  def create
    @rant = Rant.find(params[:rant_id])
    @favorite = Favorite.new(
      user_id: current_user.id,
      rant_id: @rant.id
    )
    @favorite.save
    redirect_to dashboard_path(current_user)
  end

  def destroy
    current_user.unfavorite(rant)
    redirect_to dashboard_path(current_user)
  end

  def index
    @user = current_user
    @favorites = Favorite.where(:user_id => current_user.id)
  end

end