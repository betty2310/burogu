# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
             controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  root 'home#feed'
  get 'search', to: 'home#explore'
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :posts

  mount Commontator::Engine => '/commontator'

end
