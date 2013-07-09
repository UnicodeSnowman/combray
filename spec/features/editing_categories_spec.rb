
require 'spec_helper'

feature 'editing categories' do

  before do
    @category = FactoryGirl.create(:category, name: 'Category One')

    visit "/categories/#{@category.id}/edit"
  end

  scenario 'updating a category' do

    fill_in 'Name', with: 'Category Two'
    click_button 'Update Category'

    expect(page).to have_content('Category has been updated.')
    expect(page).to have_content('Category Two')
  end

 scenario 'updating a category to an invalid value' do

   fill_in 'Name', with: ''
   click_button 'Update Category'

   expect(page).to have_content('Category has not been updated.')
 end

end
