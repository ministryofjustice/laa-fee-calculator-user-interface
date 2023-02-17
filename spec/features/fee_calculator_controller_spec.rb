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
    click_button 'find fee scheme'

    expect(page).to have_content('Trial')
  end

  scenario 'select a fee scheme and click button' do
    visit '/'
    click_button 'find fee scheme'

    expect(page).to have_content('QC')
  end
end
