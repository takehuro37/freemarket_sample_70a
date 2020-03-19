Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'profile', to: 'users/registrations#new_profile'
    post 'profile', to: 'users/registrations#create_profile'
  end
  
  get 'card/new'
  get 'card/show'

  
  resources :posts do
    collection do
      get 'category_children'
      get 'category_grandchildren'
    end
  end
  
  resources :users, only: [:index, :show]
  resources :logouts, only: [:index, :destroy]
  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      delete 'delete', to: 'card#delete'
    end
  end
  
  root to: "posts#index"
end
