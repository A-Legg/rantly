class FollowingsController < ApplicationController

  def index

   @following = Following.where(:follower_id => current_user.id)



  end


  def create

    Following.create(
      :followed_id => params[:followed_id],
      :follower_id => current_user.id
    )

  redirect_to root_path







  end



end