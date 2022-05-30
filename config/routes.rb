# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get '/users', to: 'users#index', as: :user_root

  resources :quotes, only: %i[index]

  root 'home#index'

  resources :vehicles, only: %i[index show create new edit update]
  resources :companies, only: %i[index show new create update edit]
  resources :budgets, only: %i[new create update edit]
  resources :shipping_custs, only: %i[new create update edit]
  resources :deadlines, only: %i[new create update edit]
  resources :pickup_locations, only: %i[new create]
  resources :clients, only: %i[new create]

  resources :orders, only: %i[index show create new edit update] do
    get 'search', on: :collection
    get 'list', on: :collection
  end
end
