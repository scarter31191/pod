class Topic < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 3 }
end
