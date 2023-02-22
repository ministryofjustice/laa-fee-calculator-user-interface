# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeeCalculator do
  subject(:fee_calculator) { FeeCalculator.new }

  describe '#client' do
    subject { fee_calculator.client }

    it { is_expected.to be_truthy }
  end

  describe '#fee_schemes' do
    subject { fee_calculator.fee_schemes }
    it { is_expected.to be_truthy }
  end

  it 'gives a fee type of given date' do
    expect(fee_calculator.fee_scheme(1).description).to eq 'AGFS Fee Scheme 9'
  end

  it 'calculates the fee of given type' do
    fee_scheme = fee_calculator.fee_scheme(1)
    amount = fee_scheme.calculate(
      scenario: 5,
      advocate_type: 'JRALONE',
      offence_class: 'E',
      fee_type_code: 'AGFS_APPEAL_CON',
      day: 1,
      number_of_defendants: 1,
      number_of_cases: 1
    )
    expect(amount).to eq 130
  end
end
