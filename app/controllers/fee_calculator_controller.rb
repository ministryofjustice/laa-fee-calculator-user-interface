# frozen_string_literal: true

class FeeCalculatorController < ApplicationController
  def index
    @message = 'Fee scheme'
    fee_calculator = FeeCalculator.new
    @fee_schemes = fee_calculator.fee_schemes
  end

  def fee_scheme
    fee_calculator = FeeCalculator.new
    @fee_scheme = fee_calculator.fee_scheme(params[:fee_scheme])
  end
end
