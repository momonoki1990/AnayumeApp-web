# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'search', to: 'dreamposts#search'

  # リロード時のエラー対応
  get 'users', to: 'users#new'
  get 'dreamposts', to: 'static_pages#home'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :dreamposts,          only: %i[create destroy]
  resources :relationships,       only: %i[create destroy]
  resources :likes,               only: %i[create destroy]
end
