class DashboardController < ApplicationController

  def show
    @user = current_user
    @users = User.all
    @rant = Rant.new
    @rants = Rant.all
    @following_relationships = FollowingRelationship.all
  end
end