Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'
  root to: 'books#index'

  # for future page navigating to book information
  # get '/books/:id', to: 'books#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
