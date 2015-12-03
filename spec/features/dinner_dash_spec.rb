require 'acceptance_helper'

feature 'Dinner Dash Homepage' do

  scenario 'User views home page' do
    visit '/'
    within 'h3' do
      expect(page).to have_content 'Dinner Dash'
    end
  end

end
