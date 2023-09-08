Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Hello::API => '/hello/'
  mount AuthorAPI::API => '/author/'
  mount BookAPI::API => '/book/'

  root "book#index"

  resources :book
end
