require 'spec_helper'

feature 'Creating categories' do

  before do
    visit '/categories/new'

  end

  scenario 'can create a category' do

    fill_in 'Name', with: 'New Category One'

    click_button 'Create Category'
    expect(page).to have_content('Category has been created.')

    expect(page.current_url).to eql(categories_url)

#    item = Item.where(name: 'New Item 1').first
#
#    expect(page.current_url).to eql(item_url(item))
#
#    title = 'New Item 1 - Items - Gallery'
#    expect(find('title').native.text).to have_content(title)
  end

#  scenario 'cannot create an item without a name' do
#
#    click_button 'Create Item'
#
#    expect(page).to have_content('Item has not been created.')
#    expect(page).to have_content('Name can\'t be blank')
#  end
#
#  scenario 'cannot create multiple items with the same code' do
#    
#    fill_in 'Name', with: 'Test Name'
#    fill_in 'Code', with: 4567
#    fill_in 'Description', with: 'test description'
#    click_button 'Create Item'
#
#    visit '/'
#    click_link 'New Item'
#
#    fill_in 'Name', with: 'Test Name Numero dos'
#    fill_in 'Code', with: 4567
#    fill_in 'Description', with: 'test description'
#    click_button 'Create Item'
#
#    expect(page).to have_content('Item has not been created.')
#    expect(page).to have_content('Code has already been taken')
#  end

end
