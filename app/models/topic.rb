class Topic < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :body, presence: true, length: { minimum: 3 }
end
