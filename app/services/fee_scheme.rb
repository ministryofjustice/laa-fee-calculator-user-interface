# frozen_string_literal: true

class FeeScheme
  def initialize(type, date)
    @type = type
    @date = date
  end

  def fee_scheme
    @fee_scheme ||= client.fee_schemes(type: @type, case_date: @date)
  end

  def calculate
    fee_scheme.calculate(
      scenario: 5,
      advocate_type: 'JRALONE',
      offence_class: 'E',
      fee_type_code: 'AGFS_APPEAL_CON',
      day: 1,
      number_of_defendants: 1,
      number_of_cases: 1
    )
  end

  def client
    @client ||= LAA::FeeCalculator.client
  end
end
