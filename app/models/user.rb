class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true
    validates :username, :email,  uniqueness: true

    has_many :podcasts
    has_many :topics, through: :podcasts

    def self.create_from_omniauth(auth)
            User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(12)
            # byebug
        end
    end
end
