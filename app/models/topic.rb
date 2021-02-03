class Topic < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }

    has_many :podcasts
    has_many :users, through: :podcasts

end
