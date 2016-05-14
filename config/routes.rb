Rails.application.routes.draw do
  get 'pull' => 'notifications#pull'

  resources :transactions
  get 'search' => 'search#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  root 'welcome#index'
  resources :users
  resources :stocks do
    member do
      get 'bid'
    end
  end
  get 'signup' => 'users#new'
end
