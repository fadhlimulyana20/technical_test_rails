class User < ApplicationRecord
    validates :username, presence: true
    validates :email, presence: true, format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  }
end
