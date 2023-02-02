# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeeCalculator do
  subject(:fee_calculator) { FeeCalculator.new}

  describe '#client' do
    subject { fee_calculator.client }

    it { is_expected.to be_truthy }
  end

  describe '#fee_schemes' do
    subject { fee_calculator.fee_schemes}
    it { is_expected.to be_truthy }
  end

  it 'gives a fee type of given date' do
    expect(fee_calculator.fee_scheme('AGFS', '2018-01-01').description).to eq 'AGFS Fee Scheme 9'
  end
end
