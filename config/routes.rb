Rails.application.routes.draw do
  devise_for :users
  root to: 'animals#index'
  resources :animals do
    member do
      get 'sort/:sort_by', to: 'animals#sort'
    end
    resources :doses, only: [:create, :new]
  end
  resources :drugs
  resources :doses, only: [:index]
end
