require 'spec_helper'

feature 'viewing items' do

  before do 
    @category = FactoryGirl.create(:category)
    @subcategory = FactoryGirl.create(:subcategory, category_id: @category.id)
    @item = FactoryGirl.create(:item, name: 'Test Item One', subcategory_id: @subcategory.id)

  end

  scenario 'viewing a single item' do
    visit "/items/#{@item.id}"
    expect(page.current_path).to eql(item_path(@item))
  end

  scenario 'viewing all items on the items path' do
    visit "/items" 
  end
     
end
