class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    include SingleImageable


    def to_param
        slug
    end
end
