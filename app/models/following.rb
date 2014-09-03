class Following < ActiveRecord::Base

  validates_uniqueness_of :follower_id, :scope => :followed_id


end