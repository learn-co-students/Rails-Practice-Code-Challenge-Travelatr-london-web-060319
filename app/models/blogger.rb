class Blogger < ApplicationRecord

  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :age, numericality: { greather_than: 0}
  validates :bio, length: { minimum: 30 }

  def top5uniqdestinations
    self.destinations.uniq{|destination| destination.name}.sort_by{|destination| destination.posts.count}.reverse[0..4]
  end

end
