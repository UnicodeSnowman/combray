module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/admin/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    expect(page).to have_content("logged in successfully")
  end
end

module AuthorizationHelpers
  def sign_in(user)
    session[:user_id] = user.id
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :feature
  c.include AuthorizationHelpers, type: :controller
end
