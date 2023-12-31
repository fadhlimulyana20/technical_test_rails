Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Hello::API => '/hello/'
  mount AuthorAPI::API => '/author/'
  mount BookAPI::API => '/book/'

  root "home#index"
  get "/", to: "home#index"

  # root "book#index"
  get "/book", to: "book#index", as: 'book_index'
  post "/book", to: "book#create"
  get "/book/new", to: "book#new"
end
