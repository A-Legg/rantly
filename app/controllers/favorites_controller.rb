class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.rant_id = params[:rant_id]
    @favorite.save!
    redirect_to :back
  end

  def destroy
    @favorite = Favorite.where(rant_id: params[:rant_id], user_id: current_user.id).first
    @favorite.destroy
    redirect_to :back
  end

  def index
    @rant = Rant.new
    @user = current_user
    @favorites = Favorite.where(:user_id => current_user.id)
  end

end
