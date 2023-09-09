class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def create_book_notification
    @user = params[:user]
    @book = params[:book]
    mail(to: @user.email, subject: "You have created a book")
  end
end
