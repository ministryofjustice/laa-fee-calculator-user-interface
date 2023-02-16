# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'fee_calculator#index'
  get 'index' => 'fee_calculator#index'
  post 'fee_scheme' => 'fee_calculator#fee_scheme'
  namespace :api do
    get 'fee_scheme/:id', to: 'fee_scheme#show', as: :fee_scheme
  end
end
