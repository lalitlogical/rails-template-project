# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin-panel', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
end
