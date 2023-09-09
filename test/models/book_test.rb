require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Shouldn't save without title" do
    book = Book.new
    assert_not book.save, "Saved the book without a title"
  end

  test "Shouldn't save without year" do
    book = Book.new(title: "new book")
    assert_not book.save, "Saved the book without a year"
  end


  test "Shouldn't save without author" do
    book = Book.new(title: "new book", year: 2023)
    assert_not book.save, "Saved the book without a year"
  end

  test "should belong to author" do
    author = Author.new(name: "Test1")
    author.save
    book = Book.new(title: "new book", year: 2023, author: author)
    assert book.save
    author.delete
  end
end
