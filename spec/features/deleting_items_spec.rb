require 'spec_helper'

feature 'Deleting Items' do

  before do
    FactoryGirl.create(:item, name: 'Test Item One')

    visit '/'
  end
  
  scenario 'Deleting an item' do
    
    click_link 'Test Item One'
    click_link 'Remove Item'

    expect(page).to have_content('Item has been removed.')
  end
end
