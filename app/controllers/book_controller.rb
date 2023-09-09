class BookController < ActionController::Base
  before_action :check_if_authenticated

  def index
    @books = Book.all
  end

  def new
    @books = Book.new
    @authors = Author.all
  end

  def create
    @authors = Author.all
    @book = Book.new(book_params)
    if @book.save
      current_user.delay.send_notification("You have created a new book which is entitled as #{@book.title}")
      redirect_to :book_index
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :year, :author_id)
    end

    def check_if_authenticated
      if !user_signed_in?
        redirect_to "/"
      end
    end
end
