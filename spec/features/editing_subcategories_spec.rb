
require 'spec_helper'

feature 'editing subcategories' do

  before do
    user = FactoryGirl.create(:admin_user)
    sign_in_as!(user)

    @category = FactoryGirl.create(:category)
    @subcategory = FactoryGirl.create(:subcategory, name: 'Subcategory One', category_id: @category.id)

    visit "/admin/subcategories/#{@subcategory.id}/edit"
  end

  scenario 'updating a category' do

    fill_in 'Name', with: 'Subcategory Two'
    click_button 'Update Subcategory'

    expect(page).to have_content('Subcategory has been updated.')
    expect(page).to have_content('Subcategory Two')
  end

 scenario 'updating a category to an invalid value' do

   fill_in 'Name', with: ''
   click_button 'Update Subcategory'

   expect(page).to have_content('Subcategory has not been updated.')
 end

end
