class Podcast < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :platform, :host, presence: true   
end
