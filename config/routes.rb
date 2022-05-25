# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :vehicles, only: %i[index show create new edit update]
  resources :companies, only: %i[index show new create update edit]
end
