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
  get 'myrafflr' => 'users#show'
  patch 'myrafflr' => 'users#update'
  resources :users, only: [:create, :new, :register_push, :edit] do
    collection do
      post 'register_push'
    end
  end

  get 'myrafflr/edit_password' => 'users#edit_password'
  post 'myrafflr/edit_password' => 'users#edit_password'
  get 'myrafflr/edit' => 'users#edit'
  post 'myrafflr/edit' => 'users#edit'
  get 'redeem_tokens' => 'tokens#new'
  post 'redeem_tokens' => 'tokens#create'

  resources :stocks do
    member do
      post 'bid'
      get 'poll'
    end
  end
  get 'signup' => 'users#new'
end
