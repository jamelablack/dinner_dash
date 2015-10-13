require 'acceptance_helper'

feature 'Sessions' do
  before do
    create :user, email: 'jam@example.com', password: 'password'
  end

  scenario 'User signs in' do
    visit '/sign_in'
    fill_in 'Email', with: 'jam@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(current_path).to eql '/'
    expect(page).to have_content 'signed in as: jam@example.com'
    expect(page).not_to have_content 'Sign in'
  end

  scenario 'User fails sign in' do
    visit '/sign_in'
    fill_in 'Email', with: 'nope@example.com'
    fill_in 'Password', with: 'oops'
    click_button 'Sign in'

    expect(current_path).to eql '/sign_in'
    expect(page).to have_content 'Sign in'
  end
end
