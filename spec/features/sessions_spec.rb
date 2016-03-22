require 'acceptance_helper'

feature 'Sessions' do
  before do
    create :user, email: 'jam@example.com', password: 'password'
  end

  scenario 'User signs in' do
    visit '/home'
    fill_in 'Email', with: 'jam@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(current_path).to eql '/items'
    expect(page).to have_content 'Welcome, jam@example.com'
    expect(page).to have_content "You're now signed in... order away!"
    expect(page).not_to have_content 'Sign in'

    click_link 'Sign out'

    expect(current_path).to eql '/'
    expect(page).to have_content 'Order Now'
    expect(page).to have_content "You've signed out successfully. Come back soon!"

  end

  scenario 'User signs in unsuccessfully' do
    visit '/home'
    fill_in 'Email', with: 'nope@example.com'
    fill_in 'Password', with: 'nicetry'
    click_button 'Sign in'

    expect(current_path).to eql '/home'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content "Incorrect email or password."
    expect(page).not_to have_content 'Sign out'
  end
end
