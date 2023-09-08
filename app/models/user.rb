class User < ApplicationRecord
    validates :username, presence: true
    validates :email, presence: true, format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  }

    def send_notification(msg)
        # ToDo: Hit external API
        puts "Send Email Notification to #{self.email}, with message: #{msg}"
    end
end
