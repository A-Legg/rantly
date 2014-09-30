class Rant < ActiveRecord::Base

  belongs_to :user
  default_scope { order("created_at DESC")}
  validates :rant, :description, presence: true

end