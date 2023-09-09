# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..25 do
  author = Author.new(name: Faker::Book.author)
  author.save
  book = Book.new(title: Faker::Book.title, year: 2022, author: author)
  book.save
end
