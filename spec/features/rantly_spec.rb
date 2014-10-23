require 'rails_helper'
require 'capybara/rails'

feature 'rants' do

  scenario "user can visit landing page and see banner and quotes" do
    user_sign_in
  end

  scenario "user can visit dashboard path" do
    user_sign_in

    expect(page).to have_content("Latest Rants")
  end



end




def user_sign_in

  visit root_path
  click_link "login"
  expect(page).to have_content("Rant.ly")
  fill_in "Username", with: "username"
  fill_in "Password", with: "password"
  click_on "Login"
end