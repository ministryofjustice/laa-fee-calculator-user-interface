# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Fee Calculator', type: :request do
  describe 'view the calculator page' do
    it 'has a 200 status code' do
      get index_path
    end
  end
end
