class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites
  has_many :spams

  has_many :comments, :as => :commentable
  validates :rant, :description, presence: true
  validates_length_of :rant, minimum: 140
  validates_length_of :description, maximum: 50

  def markdown(rant)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    .render(rant).html_safe

  end

  def rendered_rant
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    .render(tag_search(rant)).html_safe
  end

  def tag_search(text)
    text.gsub(/\#(\w+)/, '<a href="/searches?utf8=✓&search=\1&commit=search">#\1</a>')
  end


end