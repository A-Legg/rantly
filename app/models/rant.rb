class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites


  default_scope { order("created_at DESC")}
  validates :rant, :description, presence: true


  def favorite(rant)
    favorites << rant
  end

  def unfavorite(rant)
    favorites.delete(rant)
  end

end