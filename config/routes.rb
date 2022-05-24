# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :companies, only: %i[index show new create update edit]
end
