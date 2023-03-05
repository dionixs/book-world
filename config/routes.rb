# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :authors

  resources :books do
    resources :reviews
  end

  get '/admin/import_books', to: 'admin/books#import', as: 'import'

  devise_for :users

  get '/about', to: 'static_pages#about'
  get '/contacts', to: 'static_pages#contacts'
  get '/help', to: 'static_pages#help'
  get '/terms', to: 'static_pages#terms'

  root 'static_pages#home'
end
