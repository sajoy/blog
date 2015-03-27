require 'rails_helper'

describe 'the sign up process' do

  it 'will allow a user to create an account' do
    visit root_path
    click_link "Sign Up"
    fill_in 'Email', with: '100wpm@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it 'will require an email ' do
    visit root_path
    click_link "Sign Up"
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'
    expect(page).to have_content 'Email'
  end

end

describe 'the sign in process' do
  it 'will sign in an existing user' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"
    expect(page).to have_content user.email
  end

  it 'will not sign in an unregistered user' do
    visit root_path
    click_link "Log In"
    fill_in 'Email', with: 'saj@lol.com'
    fill_in 'Password', with: 'password'
    click_button "Log In"
    expect(page).to have_content ''
  end
end

describe 'the sign out process' do
  it 'will sign out a user' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log In"
    click_on user.email
    click_on 'Log Out'
    expect(page).to have_content 'Signed out'
  end

end
