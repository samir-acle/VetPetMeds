Rails.application.routes.draw do
  devise_for :users
  root to: 'animals#index'
  resources :animals do
    resources :doses, shallow: true
  end
  resources :drugs
end
