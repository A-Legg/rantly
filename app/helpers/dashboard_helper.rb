module DashboardHelper

  def follow_link(user)
    if current_user.following?(user)
      link_to "Unfollow", user_following_relationship_path(:id => current_user.id, :user_id => user.id), method: :delete, data: {'followed-user-id' => user.id, following: true}
    else
      link_to "Follow", user_following_relationships_path(:user_id => user.id, :id => current_user.id), method: :post, data: {'followed-user-id' => user.id, following: false}
    end
  end

  def favorite_link(rant)
    favorite = Favorite.where(rant_id: rant.id, user_id: current_user.id).first
    if favorite
      link_to "Unfavorite(#{rant.favorites.count})", user_favorite_path(:rant_id => rant.id, :user_id => current_user.id), method: :delete, data: {'rant-id' => rant.id, favorite: true, count: rant.favorites.count}
    else
      link_to "Favorite(#{rant.favorites.count})", user_favorites_path(rant_id: rant.id, user_id: current_user.id), method: :post, data: {'rant-id' => rant.id, favorite: false, count: rant.favorites.count}
    end
  end

  def spam_link(rant)

    if rant.spam?
      link_to "Unspam", rant_spam_path(rant_id: rant.id), {method: :post}
    else
      link_to "Spam", rant_spam_path(rant_id: rant.id), {method: :post}
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




