Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root      'posts#index'
  resources :posts
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
