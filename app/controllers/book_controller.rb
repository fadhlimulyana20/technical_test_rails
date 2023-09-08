class BookController < ActionController::Base
  def index
    @books = Book.all
  end

end
