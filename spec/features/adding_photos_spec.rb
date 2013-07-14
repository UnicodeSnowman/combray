require 'spec_helper'

feature 'adding photos to an item' do

  before do
    user = FactoryGirl.create(:admin_user)
    sign_in_as!(user)

    @category = FactoryGirl.create(:category, name: 'Category One')
    @subcategory = FactoryGirl.create(:subcategory, category_id: @category.id, name: 'Subcategory One')
    @item = FactoryGirl.create(:item, subcategory_id: @subcategory.id)

    visit "/admin/items/#{@item.id}/edit"
  end

  it 'should show a file field to add a photo' do

    expect(page).to have_content('Photos')
  end

  it 'should allow an admin to attach a file' do
    attach_file "Photo", "spec/fixtures/test.png"
    click_button 'Update Item'

    expect(page).to have_content('Item has been updated.')

    within('.item .photo') do
      expect(page).to have_content('test.png')
    end
  end
end
