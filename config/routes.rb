Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'creditcards', to: 'users/registrations#new_creditcard'
    post 'creditcards', to: 'users/registrations#create_creditcard'
  end

  root 'items#index'

  resources :items, only: [:index, :new, :create]do
    get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  resources :users, only: [:show, :edit, :update]do
    member do
      get 'profile'
      patch 'profile_update'
      get 'logout'
    end
    collection do
      get 'ready'
    end
  end
  namespace :items do
    resources :searches, only: [:index,:show]
    
  end

  resources :items do
    member do
      post 'purchase'
      get 'buy'
    end
  end
  
  resources :credit_cards, only: [:new, :show]do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
end
