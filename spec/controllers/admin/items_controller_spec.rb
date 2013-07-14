require 'spec_helper'

describe Admin::ItemsController do
  #let(:user) { FactoryGirl.create(:user) }

  context 'standard users' do
    before do
      user = FactoryGirl.create(:user)
      sign_in(user)
    end

    it 'cannot access the new action' do
      get :new

      expect(response).to redirect_to('/')
      expect(flash[:alert]).to eql('You must be an admin to do that')
    end
  end

  context 'untracked users' do

    it 'cannot access the new action' do
      get :new

      expect(response).to redirect_to('/')
      expect(flash[:alert]).to eql('You must be an admin to do that')
    end
  end

  context 'admin users' do

    before do
      user = FactoryGirl.create(:admin_user)
      sign_in(user)
    end

    it 'can access the new action' do
      get :new

      response.should render_template(:new)
    end
  end

  it 'displays an error for a missing item' do
    get :show, :id => 'fakeId'
    expect(response).to redirect_to(admin_categories_path)
    message = 'The item you were looking for could not be found.'
    expect(flash[:alert]).to eql(message)
  end

end
