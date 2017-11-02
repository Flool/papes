Rails.application.routes.draw do
  root 'posts#index'
  resources :users, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]  
  get '/login', to: 'sessions#new'

  resources :posts do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  # Don't know why I had to do this - band aid fix
  delete '/comment/:id', to: 'comments#destroy', as: 'comment' 
end
