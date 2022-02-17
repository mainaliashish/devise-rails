require 'rails_helper'

RSpec.describe 'Home Features' do
  before(:each) do
    visit('/')
  end

  it 'displays the home page' do
    expect(page).to have_content('Welcome to the HomePage')
  end

  it 'should display all the post' do
    click_link('All Posts')
    expect(page).to have_content('Posts')
  end

  it 'should display the login page' do
    click_link('Login')
    expect(page).to have_content('Log in')
  end

  it 'should display the login page when #all users' do
    click_link('All Users')
    expect(page).to have_content('Log in')
  end
end
