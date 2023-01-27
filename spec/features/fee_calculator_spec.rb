require "rails_helper"

RSpec.feature "Fee calculator", :type => :feature do
  scenario "Visit the page" do
    visit "/"

    expect(page).to have_content("LAA Fee Calculator User Interface")
  end
end
