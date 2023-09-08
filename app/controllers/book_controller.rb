class BookController < ActionController::Base
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
      redirect_to :book_index
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :year, :author_id)
    end

end
