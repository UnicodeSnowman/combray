require 'spec_helper'

feature 'signing in' do
  scenario 'signing in via form' do
    user = FactoryGirl.create(:user)

    visit '/admin/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"

    expect(page).to have_content("logged in successfully")
  end
end
