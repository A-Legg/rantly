class User < ActiveRecord::Base

  has_secure_password

  has_many :rant

  has_many :followings, :through => :followings, :source => "followed_id"




  validates :username, presence: true, uniqueness: {case_sensitive: false}



end