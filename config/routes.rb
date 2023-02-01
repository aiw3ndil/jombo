# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notifications
  resource :profile, path: 'me' do
    get 'reservations'
  end
  resource :vehicle
  resources :trips do
    resources :reservations
  end
  resources :stops

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'
  get '/contact', to: 'home#contact'
  get '/privacy', to: 'home#privacy'
end
