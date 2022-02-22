require 'rails_helper'

RSpec.describe 'User Features' do
  before(:each) do
    visit('/users/sign_in')
  end
  it 'should register an account with valid credentials' do
    click_link('Sign up')
    fill_in 'First name',	with: 'ashish'
    fill_in 'Last name',	with: 'mainali'
    fill_in 'Username',	with: 'amainali'
    fill_in 'Email',	with: 'amainali@gmail.com'
    fill_in 'Password',	with: 'password'
    fill_in 'Password confirmation',	with: 'password'
    click_on('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  feature 'should be able to login user' do
    let(:user) { create(:user) }
    it 'should login and logout user to the app' do
      fill_in 'Email',	with: user.email
      fill_in 'Password',	with: user.password
      check('Remember me')
      click_on('Login')
      expect(page).to have_content('Signed in successfully.')
      click_on('Logout')
      expect(page).to have_content('Logged out successfully.')
    end

    it 'should not login without email' do
      fill_in 'Email',	with: nil
      fill_in 'Password',	with: user.password
      click_on('Login')
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'should not login without password' do
      fill_in 'Email',	with: user.email
      fill_in 'Password',	with: nil
      click_on('Login')
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
