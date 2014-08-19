class Users < ActiveRecord::Base

  has_secure_password

  # validates :username, presence: true, uniqueness: {case_sensitive: false}
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :bio, presence: true

end