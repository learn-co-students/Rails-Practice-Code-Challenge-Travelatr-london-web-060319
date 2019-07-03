class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger
    validates :title, :content, presence: true
    validate :not_longer

    def not_longer
        if content.present? && content.size < 100
            errors.add(:characters, "be more than 100")
        end
    end
end
