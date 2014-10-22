class User < ActiveRecord::Base

  has_secure_password

  has_many :rants, :dependent => :destroy

  has_many :followed_user_relationships,
           foreign_key: :follower_id,
           class_name: 'FollowingRelationship'

  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
           foreign_key: :followed_user_id,
           class_name: 'FollowingRelationship'

  has_many :followers, through: :follower_relationships

  has_many :favorites


  validates_uniqueness_of :username, :message => '%{value} has already been taken'
  validates_presence_of :username, :first_name, :last_name, :bio

  validates :password, length: {minimum: 8}


  def following?(user)
    followed_user_ids.include? user.id
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

end