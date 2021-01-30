class Podcast < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :platfrom, presence: true   
    validates :host, presence: true  
end
