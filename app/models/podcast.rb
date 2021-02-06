class Podcast < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    # validates :platform, :host, presence: true   

    belongs_to :topic
    belongs_to :user

    accepts_nested_attributes_for :topic, reject_if: proc { |attributes| attributes['title'].blank? } 
    
end
