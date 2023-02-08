# frozen_string_literal: true

class FeeCalculatorController < ApplicationController
  def index
    @message = 'Fee scheme'
    fee_calculator = FeeCalculator.new
    @fee_schemes = fee_calculator.fee_schemes
    @fee_scheme = fee_calculator.fee_scheme('AGFS', '2022-09-29')
  end
end
