class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true #, message: "unique name please" # unique name
    validates :age, numericality: { greater_than: 0 }#, message: "age must be greater than 0" # age must be greater than 0
    validates :bio, length: { minimum: 30 }#, message: "Bio must be over 30 characters long!" # over 30 characters long

    def most_liked_post
        self.posts.max_by{ |post| post.likes } 
    end

    def total_likes
        self.posts.sum { |post| post.likes } 
    end

    def destination_frequency
        frequency_hash = Hash.new(0)
        self.posts.each do |value|
            frequency_hash[value.destination.name] += 1
        end 
        frequency_hash
    end

    def sorted_destinations
        destination_frequency.sort_by { |key, value| value}.first(5)
    end

    def most_frequent_destinations
        destinations = []
        sorted_destinations.collect do |d|
            destinations << d.first
        end
        destinations
    end

end
