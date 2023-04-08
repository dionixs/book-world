# frozen_string_literal: true

Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do

    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    devise_for :users,
               path: 'user',
               controllers: { registrations: 'users/registrations' },
               path_names: {
                 sign_in: 'login', sign_out: 'logout',
                 password: 'password_reset', edit: 'settings/account'
               }

    resource :profile,
             only: %i[edit update],
             path: '/user/settings/profile',
             path_names: { edit: '' } do
      resource :avatar, only: %i[update destroy]
    end

    resources :authors do
      patch :archive, on: :member
      collection do
        get 'letter-:initial', to: 'authors#by_initial_letter', as: 'by_initial_letter'
      end
    end

    resources :books do
      resources :reading_lists, only: %i[create update destroy]

      patch :archive, on: :member
      resources :reviews
    end

    resources :genres, only: %i[show]

    get '/search', to: 'search#search', as: :search

    get '/about', to: 'static_pages#about'
    get '/faq', to: 'static_pages#faq'
    get '/contacts', to: 'static_pages#contacts'
    get '/help', to: 'static_pages#help'
    get '/terms', to: 'static_pages#terms'

    root 'static_pages#home'
  end
end
