Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'boards#index'
  
  get '/boards/:id', to: 'boards#show', as: :boards_show

  get '/boards/:id/topics/new', to: 'board_topics#new', as: :board_topics_new
  post '/boards/:id/topics/new', to: 'board_topics#create', as: :board_topics_create
end
