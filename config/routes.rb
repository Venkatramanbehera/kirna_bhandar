# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    post '/login', to: 'sessions#create', as: :login
    post '/signup', to: 'registrations#create', as: :signup

    devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' },
                       path_names: {}
    resource :user, only: %i[show update]
  end
end
