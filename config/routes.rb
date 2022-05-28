# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get '/users', to: 'users#index', as: :user_root

  resources :quotes, only: %i[index] do
    get 'consult', on: :collection
    get 'search', on: :collection
  end

  root 'home#index'

  resources :vehicles, only: %i[index show create new edit update]
  resources :companies, only: %i[index show new create update edit]
  resources :budgets, only: %i[new create update edit]
  resources :shipping_custs, only: %i[new create update edit]
  resources :deadlines, only: %i[new create update edit]
end
