class Project < ApplicationRecord
    validates :title, presence: {message: "project title must be given"}
    validates :excerpt, presence: {message: "a short summary of your project must be given"}
    validates :description, presence: {message: "project description must be given"}
    has_one_attached :image

    include SingleImageable

    def to_param
        slug
    end
end
