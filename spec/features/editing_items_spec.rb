require 'spec_helper'

feature 'editing items' do

  before do
    FactoryGirl.create(:item, name: 'Test Item One')

    visit '/'
    click_link 'Test Item One'
    click_link 'Edit Item'
  end

  scenario 'updating an item' do

    fill_in 'Name', with: 'Test Item Two'
    click_button 'Update Item'

    expect(page).to have_content('Item has been updated.')
  end

  scenario 'updating an item to an invalid value' do

    fill_in 'Name', with: ''
    click_button 'Update Item'

    expect(page).to have_content('Item has not been updated.')
  end

end
