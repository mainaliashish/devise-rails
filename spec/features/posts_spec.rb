require 'rails_helper'
require 'faker'

RSpec.describe 'Post Features' do
  before(:each) do
    visit '/posts'
  end

  it 'should be able to view posts' do
    expect(page).to have_content('Posts')
  end

  feature 'posts' do
    let(:user) { create(:user) }
    it 'should login create, update and delete post' do
      click_link('Login')
      fill_in 'Email',	with: user.email
      fill_in 'Password',	with: user.password
      click_on('Login')
      expect(page).to have_content('Signed in successfully.')
      click_link('New post')
      expect(page).to have_content('New post')
      fill_in 'Title',	with: Faker::Lorem.sentence(word_count: 5)
      find('#post_content_trix_input_post', visible: false).set(Faker::Lorem.sentence(word_count: 25))
      click_on('Create Post')
      expect(page).to have_content('Post Was Successfully Created!')
      click_link('Edit this post')
      expect(page).to have_content('Editing post')
      fill_in 'Title',	with: Faker::Lorem.sentence(word_count: 5)
      find('#post_content', visible: false).set(Faker::Lorem.sentence(word_count: 25))
      click_on('Update Post')
      expect(page).to have_content('Post Was Updated Successfully!')
      click_on('Destroy this post')
      expect(page).to have_content('Post Was Deleted Successfully!')
    end
  end
  # it 'should be able to show each post' do
  #   find('.show-post').first(:link, 'Show').click
  #   expect(page).to have_content('Back to all posts')
  # end
end
