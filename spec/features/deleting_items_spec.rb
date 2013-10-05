require 'spec_helper'

feature 'Deleting Items' do

  before do
    user = FactoryGirl.create(:admin_user)
    sign_in_as!(user)

    @category = FactoryGirl.create(:category)
    @subcategory = FactoryGirl.create(:subcategory, category_id: @category.id)
    @item = FactoryGirl.create(:item, name: 'Test Item One', subcategory_id: @subcategory.id)

    visit "/admin/items/#{@item.id}"
  end
  
  scenario 'Deleting an item' do
    
    click_link 'Remove Item'

    expect(page).to have_content('Item has been removed.')
  end
end
