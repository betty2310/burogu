# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
                     controllers: {
                       omniauth_callbacks: 'users/omniauth_callbacks',
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  root 'home#index'
  resources :user, only: [:index, :show]
  resources :posts
end
