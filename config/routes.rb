# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :articles
  resources :categories, except: [:delete]

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
