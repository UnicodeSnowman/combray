require 'spec_helper'

describe ItemsController do

  it 'displays an error for a missing item' do
    get :show, :id => 'fakeId'
    expect(response).to redirect_to(items_path)
    message = 'The item you were looking for could not be found.'
    expect(flash[:alert]).to eql(message)
  end

end
