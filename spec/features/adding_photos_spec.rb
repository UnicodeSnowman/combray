require 'spec_helper'

feature 'adding photos to an item', js: true do

  before do
    user = FactoryGirl.create(:admin_user)
    sign_in_as!(user)

    @category = FactoryGirl.create(:category, name: 'Category One')
    @subcategory = FactoryGirl.create(:subcategory, category_id: @category.id, name: 'Subcategory One')

    visit "/admin/items/new"
  end


  it 'should allow an admin to attach a file when creating a new item' do
    fill_in "Code", with: '1294712'
    fill_in "Name", with: 'Item Test Name'
    fill_in "Description", with: 'Item Description'

    attach_file "Photo #1", Rails.root.join("spec/fixtures/test_one.png")

    click_link 'Add Photo'
    attach_file "Photo #2", Rails.root.join("spec/fixtures/test_two.png")

#    attach_file "Photo #3", "spec/fixtures/test_three.png"

    click_button 'Create Item'

    expect(page).to have_content('Item has been created.')

    within('.item .photos') do
       expect(page).to have_css('.photo', :count => 2)
#      expect(page).to have_content('test_one.png')
#      expect(page).to have_content('test_two.png')
      #expect(page).to have_content('test_three.png')
    end
  end

end
