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

  scenario 'show the fee scheme page' do
    visit '/'
    click_button 'Continue'

    expect(page).to have_content('Trial')
  end

  scenario 'select a fee scheme and click button should be on the fee scheme page' do
    visit '/'
    click_button 'Continue'

    expect(page).to have_content('QC')
  end

  scenario 'show the amount page' do
    visit '/'
    click_button 'Continue'
    click_button 'Calculate'
    expect(page).to have_content('Amount')
  end
end
