# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "movies#index"

  resources :halls
  resources :movies
  resources :screenings do
    resources :reservations, except: :index do
      member do
        patch :confirm
        patch :cancel
      end
    end
  end

  resources :reservations, only: :index
end
