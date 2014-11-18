class DashboardController < ApplicationController

  def show
    @user = current_user
    @users = User.all
    @rant = Rant.new
    @rants = Rant.all.where(:spam => false).order("created_at DESC")
    @following_relationships = FollowingRelationship.all
    @mentions = Rant.where('rant LIKE ?', "%@"+"#{current_user.username}"+"%")
  end
end