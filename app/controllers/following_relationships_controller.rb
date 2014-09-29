class FollowingRelationshipsController < ApplicationController

  def index
   @following_relationships = FollowingRelationship.where(:follower_id => current_user.id)
  end
  def create

    @rant = Rant.find_by(params[:rant_id])
    @following_relationship = FollowingRelationship.new(
      :follower_id => current_user.id,
      :followed_user_id => @rant.user_id
    )

    @following_relationship.save
    redirect_to dashboard_path(current_user)


  end

  def destroy
    @rant = Rant.find_by(params[:rant_id])
    @following_relationship = FollowingRelationship.where(:follower_id => current_user.id, :followed_user_id => @rant.user_id).first
    @following_relationship.destroy
    redirect_to dashboard_path(current_user)
  end

  private

  def user
    @_user = User.find(params[:user_id])
  end

end
