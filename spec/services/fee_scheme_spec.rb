# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeeScheme do
  subject(:fee_scheme) { FeeScheme.new('AGFS', '2018-01-01') }

  describe '#client' do
    subject { fee_scheme.client }

    it { is_expected.to be_truthy }
  end

  describe '#fee_scheme' do
    subject { fee_scheme.fee_scheme }
    it { is_expected.to be_truthy }
  end

  it 'calculates the fee of given type' do
    expect(fee_scheme.calculate).to eq 130
  end
end
