require 'acceptance_helper'

feature 'Admin Manages Items' do
  before do
    create :admin, email: 'admin@example.com', password: 'password'
    create :user, email: 'user@example.com', password: 'password'
  end
  scenario 'Admin adds Item' do
    visit '/home'
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Add Item'
  end

  scenario 'User cannot add an item' do
    visit '/home'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    visit admin_items_path

    expect(page).not_to have_content 'Add Item'
    expect(page).to have_content "You're not authorized to do that"
  end
end


