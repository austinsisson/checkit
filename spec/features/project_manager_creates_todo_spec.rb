require 'rails_helper'

feature 'Project manager creates to-do list' do
  scenario 'Succesfully' do
    visit new_list_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
      expect( page ).to have_content('Your new to-do was saved!')
      expect( page ).to have_content('Meet up with the team')
  end
end
