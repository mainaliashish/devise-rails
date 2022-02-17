require 'rails_helper'

RSpec.describe 'Home Features' do
  it 'displays the home page' do
    visit('/')
    expect(page).to have_content('Welcome to the HomePage')
  end
end
