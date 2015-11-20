Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get 'new', to: 'home#new'
  post 'new', to: 'home#create'
  get 'show', to: 'home#show'

  resources :animals do
    resources :doses, only: [:create, :new]
  end

  resources :drugs, only: [:index]
  resources :doses, only: [:show, :destroy, :index]
end
