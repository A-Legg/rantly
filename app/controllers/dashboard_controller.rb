class DashboardController < ApplicationController

  def show
    @user = current_user
    @users = User.all
    @rant = Rant.new
    @rants = Rant.all.order("created_at DESC")
    @following_relationships = FollowingRelationship.all
  end
end