require 'spec_helper'

feature 'viewing categories' do

  before do
    @category_one = FactoryGirl.create(:category, name: 'Category One')
    FactoryGirl.create(:category, name: 'Category Two')
    FactoryGirl.create(:category, name: 'Category Three')

    FactoryGirl.create(:subcategory, name: 'Subcategory One', category_id: @category_one.id)
    FactoryGirl.create(:subcategory, name: 'Subcategory Two', category_id: @category_one.id)

    visit '/'
  end

  scenario 'listing all categories' do
    expect(page).to have_content('Category One')
    expect(page).to have_content('Category Two')
    expect(page).to have_content('Category Three')
  end

  scenario 'can view a category' do
    click_link 'Category One'

    expect(page.current_url).to eql(category_url(@category_one))
    expect(page).to have_content('Viewing Items for: Category One')
  end

  scenario 'can view subcategories nested under a category' do
    click_link 'Category One'

    expect(page.current_url).to eql(category_url(@category_one))
    expect(page).to have_content('Subcategory One')
    expect(page).to have_content('Subcategory Two')

  end
end
