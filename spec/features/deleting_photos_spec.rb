require 'spec_helper'

feature 'adding photos to an item' do

  before do
    user = FactoryGirl.create(:admin_user)
    sign_in_as!(user)

    @category = FactoryGirl.create(:category, name: 'Category One')
    @subcategory = FactoryGirl.create(:subcategory, category_id: @category.id, name: 'Subcategory One')

    visit '/admin/items/new'

    fill_in "Code", with: '1294712'
    fill_in "Name", with: 'Item Test Name'
    fill_in "Description", with: 'Item Description'

    attach_file "Photo #1", "spec/fixtures/test_one.png"
    
    click_button 'Create Item'
    expect(page).to have_content('Item has been created')

    #click_link 'Edit Item'
  end

  it 'should allow an admin to delete a photo' do


    click_link 'Remove Photo'

    expect(page).to have_content('Photo has been deleted')

    #within('.item .photos') do
      #expect(page).not have_content('test_one.png')
    #end
  end

end
