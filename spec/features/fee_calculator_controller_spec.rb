# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Fee calculator', type: :feature do
  scenario 'Visit the page' do
    visit '/'

    expect(page).to have_content('LAA Fee Calculator User Interface')
  end

  scenario 'Visit the page' do
    visit '/'

    expect(page).to have_content('AGFS Fee Scheme 9')
  end

  scenario 'Visit the page' do
    visit '/'

    expect(page).to have_content('Trial')
  end

  scenario 'Visit the page' do
    visit '/'

    expect(page).to have_content('QC')
  end
end
