require 'spec_helper'
require 'rails_helper'

feature 'creating a user' do
  background  :each do
    visit new_user_url
  end

  scenario "can create a new user" do 
    fill_in('username', with: 'sam_i_am')
    fill_in('password', with: 'password')

    click_button('Sign Up')

    expect(page).to have_content('Hello, sam_i_am')
    expect(current_path).to eq(user_path(User.last.id))
    expect(page).to have_button('Log Out!')
  end

  feature "can log in and log out a user", type: :feature do
    background :each do
      create(:user) 
    end

    scenario "can log in a user" do
      login_user(User.last)
      expect(page).to have_content "Hello, #{User.last.username}"
      expect(current_path).to eq(users_path)
    end

    scenario "can log out a user" do
      login_user(User.last)
      # visit root_url 
      
      click_button('Log Out!')
      expect(page).to have_content 'Successfully logged out!'
      expect(current_path).to eq(new_session_path)
    end
  end
end