require 'rails_helper'
require 'capybara/rails'

feature 'rants' do

  scenario "user can visit landing page and see banner and quotes" do
    visit root_path
    expect(page).to have_content("Test")
  end



end