# frozen_string_literal: true

Rails.application.routes.draw do
  resources :authors

  resources :books do
    resources :reviews
  end

  get '/about', to: 'static_pages#about'
  get '/contacts', to: 'static_pages#contacts'
  get '/help', to: 'static_pages#help'
  get '/terms', to: 'static_pages#terms'

  root 'static_pages#home'
end
