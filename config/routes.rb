Rails.application.routes.draw do

  root to: 'books#index'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # for future page navigating to book information
  # get '/books/:id', to: 'books#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
