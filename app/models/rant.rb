class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites

  validates :rant, :description, presence: true

end