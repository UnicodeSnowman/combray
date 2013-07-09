require 'spec_helper'

feature 'Deleting Items' do

  before do
    @category = FactoryGirl.create(:category)
    @subcategory = FactoryGirl.create(:subcategory, category_id: @category.id)
    @item = FactoryGirl.create(:item, name: 'Test Item One', subcategory_id: @subcategory.id)

    visit "/items/#{@item.id}"
  end
  
  scenario 'Deleting an item' do
    
    click_link 'Remove Item'

    expect(page).to have_content('Item has been removed.')
  end
end
