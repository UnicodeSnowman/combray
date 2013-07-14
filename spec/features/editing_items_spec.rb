require 'spec_helper'

feature 'editing items' do

  before do

    FactoryGirl.create(:admin_user)

    visit '/admin/login'
    fill_in 'Email', with: 'caplingerc@gmail.com'
    fill_in 'Password', with: 'testpass'
    click_button 'Log In'

    @category = FactoryGirl.create(:category)
    @subcategory = FactoryGirl.create(:subcategory, category_id: @category.id)
    @item = FactoryGirl.create(:item, name: 'Test Item One', subcategory_id: @subcategory.id)
    
    visit "/admin/items/#{@item.id}/edit"
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
