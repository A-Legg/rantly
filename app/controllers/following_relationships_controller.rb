class FollowingRelationshipsController < ApplicationController
  respond_to :json

  def index
    @rant = Rant.new
    @following_relationships = FollowingRelationship.where(:follower_id => current_user.id)
  end

  def create
    @following_relationship = FollowingRelationship.new
    @following_relationship.follower_id = current_user.id
    @following_relationship.followed_user_id = params[:id]
    @following_relationship.save
   render json: User.find(params[:id])
  end

  def destroy
    @following_relationship = FollowingRelationship.where(followed_user_id: params[:id], follower_id: current_user.id).first
    @following_relationship.destroy
    render json: User.find(params[:id])
  end

  private

  def user
    @_user = User.find(params[:user_id])
  end

end
