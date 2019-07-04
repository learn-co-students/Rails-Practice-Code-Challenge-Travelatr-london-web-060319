class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_liked_post
        self.posts.max_by{ |post| post.likes } 
    end

    def average_blogger_age
        unique_bloggers = self.posts.collect {|post| post.blogger}.uniq
        unique_bloggers.sum{ |blogger| blogger.age} / unique_bloggers.count
    end

    def most_recent_posts
        self.posts.last(5)
    end

end
