# frozen_string_literal: true

class FeeCalculator

  def fee_schemes
    @fee_schemes ||= client.fee_schemes
  end

  def fee_scheme(type, date)
    @fee_scheme ||= client.fee_schemes(type: type, case_date: date)
  end

  def client
    @client ||= LAA::FeeCalculator.client
  end

end
