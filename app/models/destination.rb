class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_five
        self.posts.max_by(5) {|p| p.created_at}
    end

    def average_age
        age = self.bloggers.uniq.map {|b| b.age}
        age.sum/age.size.to_f
    end

    def most_liked
        self.posts.max_by(&:likes)
    end

end
