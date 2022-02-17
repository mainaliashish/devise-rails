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
end
