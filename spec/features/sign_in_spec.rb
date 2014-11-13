require 'rails_helper'

describe "Sign In" do
  
  describe "successful sign-in" do
    it "redirects to user page" do
      visit root_path
      
      click_link 'Sign In'
      
      fill_in
      
    end
  end
  
end
