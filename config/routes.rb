# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :dreamspost,          only: %i[create destroy]
  resources :relationships,       only: %i[create destroy]
  resources :likes,               only: %i[create destroy]
end
