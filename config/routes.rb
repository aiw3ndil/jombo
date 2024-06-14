# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/(:locale)', locale: /es|en/ do
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
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations'
    }, skip: :omniauth_callbacks
    
    get '/contact', to: 'home#contact'
    get '/privacy', to: 'home#privacy'
  
    root to: 'home#index'
  end
  
  devise_for :users, only: :omniauth_callbacks, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
