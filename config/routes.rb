Rails.application.routes.draw do

  resources :transactions
  get 'search' => 'search#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  root 'welcome#index'
  get 'myrafflr' => 'users#show'
  resources :users do
    
    get 'edit_password' => 'users#edit_password'
    get 'redeem_tokens' => 'tokens#new'
    post 'redeem_tokens' => 'tokens#create'
  end
  resources :stocks do
    member do
      post 'bid'
    end
  end
  get 'signup' => 'users#new'
end
