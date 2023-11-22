class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image


    def to_param
        slug
    end
    def image_link
        if image.attached?
            image
        else
            "default.jpg"
        end
    end
end
