Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  root to: redirect('users/sign_in')
  resources :animals do
    member do
      get 'sort/:sort_by', to: 'animals#sort'
    end
    resources :doses, only: [:create, :new]
  end
  resources :drugs
  resources :doses, only: [:index] do
    collection do
      get 'sort/:sort_by', to: 'doses#sort'
    end
  end
  resources :doses, only: [:show]
end
