# frozen_string_literal: true

class FeeCalculatorController < ApplicationController
  def index
    @message = 'Fee scheme'
    @fee_schemes = FeeCalculator.new.fee_schemes
    @fee_scheme = FeeCalculator.new.fee_scheme('AGFS', '2022-09-29')
  end
end
