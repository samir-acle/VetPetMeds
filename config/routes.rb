Rails.application.routes.draw do
  devise_for :users
  root to: 'animals#index'
  resources :animals do
    resources :doses, only: [:create, :new]
  end
  resources :drugs
  resources :doses, only: [:index]
end
