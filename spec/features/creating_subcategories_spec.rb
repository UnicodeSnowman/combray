require 'spec_helper'

feature 'Creating subcategories' do

  before do
    @category = FactoryGirl.create(:category, name: 'Category One')
    visit '/subcategories/new'
  end

  scenario 'can create a subcategory' do
    fill_in 'Name', with: 'Subcategory One'
    select 'Category One', :from => 'subcategory_category_id'

    click_button 'Create Subcategory'

    expect(page).to have_content('Subcategory has been created.')
  end

  scenario 'cannot create a subcategory without a valid name' do
    fill_in 'Name', with: ''
    select 'Category One', :from => 'subcategory_category_id'

    click_button 'Create Subcategory'

    expect(page).to have_content('Subcategory has not been created.')
  end
end
