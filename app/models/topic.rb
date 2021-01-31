class Topic < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :body, presence: true, length: { minimum: 3 }

    has_many :podcasts
    has_many :users, through: :podcasts
end
