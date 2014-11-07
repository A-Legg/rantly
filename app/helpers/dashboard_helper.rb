module DashboardHelper

  def follow_link(user)
    if current_user.following?(user)
      link_to "Unfollow", user_following_relationship_path(:id => current_user.id, :user_id => user.id), {method: :delete}
    else
      link_to "Follow", user_following_relationships_path(:user_id => user.id, :id => current_user.id), {method: :post}
    end
  end

  def favorite_link(rant)
    favorite = Favorite.where(rant_id: rant.id, user_id: current_user.id).first
    if favorite
      link_to "#{rant.favorites.count} - Unfavorite", user_favorite_path(:rant_id => rant.id, :user_id => current_user.id), {method: :delete}
    else
      link_to "#{rant.favorites.count} - Favorite", user_favorites_path(rant_id: rant.id, user_id: current_user.id), {method: :post}
    end
  end

  def spam_link(rant)
    spam = Spam.where(rant_id: rant.id, user_id: current_user.id).first
    if spam
      link_to "Unspam", spam_path(rant_id: rant.id, user_id: current_user.id), {method: :delete}
    else
      link_to "Spam", spams_path(rant_id: rant.id, user_id: current_user.id), {method: :post}
    end
  end

  def disable_link(user)
    if user.disabled = true
      link_to "Enable", disabled_path(user_id: user.id), {method: :update}
    else
      link_to "Disable", disabled_path(user_id: user.id), {method: :update}
    end

  end


end




