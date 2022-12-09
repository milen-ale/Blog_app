# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # get 'likes/create'

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end

    
  end

  
 


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
end
