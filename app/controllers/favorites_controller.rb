class FavoritesController < ApplicationController
  respond_to :json

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.rant_id = params[:id]
    @favorite.save
    respond_with Rant.find(params[:id])
  end

  def destroy
    @favorite = Favorite.where(rant_id: params[:id], user_id: current_user.id).first
    @favorite.destroy
    respond_with Rant.find(params[:id])
  end

  def index
    @rant = Rant.new
    @user = current_user
    @favorites = Favorite.where(:user_id => current_user.id)
  end

end
