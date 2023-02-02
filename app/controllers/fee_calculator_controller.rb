# frozen_string_literal: true

class FeeCalculatorController < ApplicationController

  def index
    @message = 'Fee scheme'
    @fee_schemes = FeeCalculator.new.fee_schemes
  end
end
