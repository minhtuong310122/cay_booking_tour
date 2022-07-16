# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root "home#index"

  namespace :admin do
    root "home#index"

    resources :tours
  end
end
