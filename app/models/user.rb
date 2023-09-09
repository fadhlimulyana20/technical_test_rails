class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    validates :username, presence: true
    validates :email, presence: true, format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  }

    def send_notification_create_book(book)
        # ToDo: Hit external API
        puts "Send Email Notification to #{self.email}, with message: you have created book: #{book}"

        UserMailer.with(user: self, book: book).create_book_notification.deliver_now
    end
end
