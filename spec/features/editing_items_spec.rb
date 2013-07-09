require 'spec_helper'

feature 'editing items' do

  before do
    @category = FactoryGirl.create(:category)
    @subcategory = FactoryGirl.create(:subcategory, category_id: @category.id)
    @item = FactoryGirl.create(:item, name: 'Test Item One', subcategory_id: @subcategory.id)

    visit "/items/#{@item.id}"
    click_link 'Edit Item'
  end

  scenario 'updating an item' do

    fill_in 'Name', with: 'Test Item Two'
    click_button 'Update Item'

    expect(page).to have_content('Item has been updated.')
    expect(page).to have_content('Test Item Two')
  end

  scenario 'updating an item to an invalid value' do

    fill_in 'Name', with: ''
    click_button 'Update Item'

    expect(page).to have_content('Item has not been updated.')
  end

end
