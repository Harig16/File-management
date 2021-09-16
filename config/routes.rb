Rails.application.routes.draw do
  
  resources :documents, only: [:index, :show, :new, :create, :destroy]
  root to: "documents#index"

  get 'signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'tags/:tag', to: 'documents#tagged', as: "tag"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
