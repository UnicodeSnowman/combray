require 'spec_helper'

feature 'Creating Items' do

  before do
    visit '/'

    click_link 'New Item'
  end

  scenario 'can create a project' do

    fill_in 'Code', with: '1234'
    fill_in 'Name', with: 'New Item 1'
    fill_in 'Description', with: 'A nice item'
    fill_in 'Size', with: '22 W x 21 H x 6 D cm'
    fill_in 'Year', with: '1900-1984'
    fill_in 'Origin', with: 'France'

    click_button 'Create Item'
    expect(page).to have_content('Item has been created.')

    item = Item.where(name: 'New Item 1').first

    expect(page.current_url).to eql(item_url(item))

    title = 'New Item 1 - Items - Gallery'
    expect(find('title').native.text).to have_content(title)
  end

  scenario 'cannot create an item without a name' do

    click_button 'Create Item'

    expect(page).to have_content('Item has not been created.')
    expect(page).to have_content('Name can\'t be blank')
  end

  scenario 'cannot create multiple items with the same code' do
    
    fill_in 'Name', with: 'Test Name'
    fill_in 'Code', with: 4567
    fill_in 'Description', with: 'test description'
    click_button 'Create Item'

    visit '/'
    click_link 'New Item'

    fill_in 'Name', with: 'Test Name Numero dos'
    fill_in 'Code', with: 4567
    fill_in 'Description', with: 'test description'
    click_button 'Create Item'

    expect(page).to have_content('Item has not been created.')
    expect(page).to have_content('Code has already been taken')
  end

end
