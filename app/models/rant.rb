class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites

  has_many :comments, :as => :commentable
  validates :rant, :description, presence: true
    validates_length_of :rant, minimum: 140
    validates_length_of :description, maximum: 50

end