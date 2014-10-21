require 'rails_helper'
require 'capybara/rails'

feature 'rants' do

  scenario "user can visit landing page and see banner and quotes" do
    visit root_path
    expect(page).to have_content("Rantly")
  end

  scenario "user can visit dashboard path" do
    visit dashboard_path
    expect(page).to have_content("blah blah blah")
  end



end