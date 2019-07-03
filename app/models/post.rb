class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination
    validates :content, length: { minimum: 100 } #, message: "Bio must be over 30 characters long!" # over 30 characters long
    validates :title, presence: true

    def like_the_post
        if self.likes.nil?
            self.likes = 1
        else
            self.likes+=1
        end
    end
end
