# frozen_string_literal: true

Rails.application.routes.draw do
  resources :likes
  resources :posts
  resources :users
  resources :comments
  # get 'pages/hello'
  root 'pages#hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
