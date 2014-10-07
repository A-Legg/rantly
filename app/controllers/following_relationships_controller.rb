class FollowingRelationshipsController < ApplicationController

  def index
    @rant = Rant.new
   @following_relationships = FollowingRelationship.where(:follower_id => current_user.id)
  end

  def create

    current_user.follow(user)
    redirect_to dashboard_path(current_user)
  end

  def destroy

    current_user.unfollow(user)
    redirect_to dashboard_path(current_user)
  end



  private

  def user
    @_user = User.find(params[:user_id])
  end

end
