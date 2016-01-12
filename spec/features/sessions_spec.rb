require 'acceptance_helper'

feature 'Sessions' do
  before do
    create :user, email: 'jam@example.com', password: 'password'
  end

  scenario 'User signs in' do
    visit '/'
    fill_in 'Email', with: 'jam@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(current_path).to eql '/items'
    expect(page).to have_content 'Welcome, jam@example.com'
    expect(page).not_to have_content 'Sign in'
  end
end
