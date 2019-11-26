Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'boards#index'
  
  get '/boards/:id', to: 'boards#show', as: :boards_show

  get '/boards/:id/topics/new', to: 'board_topics#new', as: :board_topics_new
  post '/boards/:id/topics/new', to: 'board_topics#create', as: :board_topics_create

  get '/users/new', to: 'users#new', as: :users_new
  post '/users/new', to: 'users#create', as: :users_create
  post '/users/logout', to: 'users#logout', as: :users_logout
end
