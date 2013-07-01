require 'spec_helper'

feature 'viewing items' do
  scenario 'listing all items' do
    item = FactoryGirl.create(:item, name: 'Test Item One', code: 238475)

    visit '/'
    click_link 'Test Item One'
    expect(page.current_url).to eql(item_url(item))
  end
end
