module DashboardHelper

  def follow_button(user)
    if current_user.following?(user)
      button_to "Unfollow", user_following_relationship_path(:id => current_user.id, :user_id => user.id), {method: :delete}
    else
      button_to "Follow", user_following_relationships_path(:user_id => user.id, :id => current_user.id)
    end
  end



  def favorite_link(rant)
    button_to "Favorite", user_favorites_path(:rant_id => rant.id, :user_id => current_user.id)
  end

  def unfavorite_link(rant)
    button_to "Unfavorite", user_favorites_path(:rant_id => rant.id, :user_id => current_user.id), {method: :delete}
  end

end


