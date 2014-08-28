class User < ActiveRecord::Base

  has_secure_password

  has_many :rant

  validates :username, presence: true, uniqueness: {case_sensitive: false}


end