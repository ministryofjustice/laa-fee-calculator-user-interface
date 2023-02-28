# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'fee_calculator#index'
  get 'index' => 'fee_calculator#index'
  post 'fee_scheme' => 'fee_calculator#fee_scheme'
  post 'amount' => 'fee_calculator#amount'
end
