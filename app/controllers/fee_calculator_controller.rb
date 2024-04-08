# frozen_string_literal: true

class FeeCalculatorController < ApplicationController
  before_action :set_fee_scheme, only: [:fee_scheme, :amount]
  FEE_PARAMS =  %i[scenario offence_class advocate_type fee_type_code case day defendant fixed halfday hour month ppe pw third number_of_cases number_of_defendants trial_length pages_of_prosection_evidence retrial_interval third_cracked]

  def index
    fee_calculator = FeeCalculator.new
    @fee_schemes = fee_calculator.fee_schemes
  end

  def fee_scheme
  end

  def amount
    @amount = @fee_scheme.calculate do |options|
      FEE_PARAMS.each do |param|
          options[param] = amount_params[param] if amount_params[param].present?
      end
    end
  end

  private
  def set_fee_scheme
    fee_calculator = FeeCalculator.new
    @fee_scheme = fee_calculator.fee_scheme(params[:fee_scheme])
  end

  def amount_params
    params.permit(
      :fee_scheme,
      :authenticity_token,
      :scenario,
      :offence_class,
      :advocate_type,
      :fee_type_code,
      :day,
      :case,
      :defendant,
      :fixed,
      :halfday,
      :hour,
      :month,
      :ppe,
      :hearing,
      :pw,
      :third,
      :number_of_cases,
      :number_of_defendants,
      :pages_of_prosection_evidence,
      :trial_length,
      :retrial_interval,
      :third_cracked
    )
  end
end
