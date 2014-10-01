module DashboardHelper

  def follow_button(user)
    button_to "Follow", user_following_relationships_path(:user_id => user.id, :id => current_user.id)
  end

  def unfollow_button(user)
    button_to "Unfollow", user_following_relationship_path(:id => current_user.id,:user_id => user.id), {method: :delete}
  end

end