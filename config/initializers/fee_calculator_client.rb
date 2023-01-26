# frozen_string_literal: true

LAA::FeeCalculator.configure do |config|
  config.host = ENV['LAA_FEE_CALCULATOR_HOST'] if ENV['LAA_FEE_CALCULATOR_HOST']
  config.cache = Rails.cache
  config.logger = Rails.logger
end
