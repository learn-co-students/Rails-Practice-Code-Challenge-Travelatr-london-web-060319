class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validate :age_cannot_be, :bio_longer

    def age_cannot_be
        if age.present? && age < 0
            errors.add(:age, "cant be less than 0.")
        end
    end
    def bio_longer
        if bio.present? && bio.size < 30
            errors.add(:bio, "is too short!")
        end
    end
    def total_likes
        self.posts.map {|p| p.likes}.compact.sum
    end

    def most_liked
        self.posts.max_by {|p| p.likes.to_f}
    end

    def top_five
        dest = self.posts.map {|p| p.destination.name}
        dest_h = Hash.new(0)
        dest.each do |v|
            dest_h[v] += 1
        end
        dest_h.sort_by {|k, v| v}
    end
end
