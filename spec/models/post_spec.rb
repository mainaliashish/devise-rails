require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'should validate the post title and content' do
    it 'should not have empty title' do
      post = build(:post, title: nil, user: build(:user))
      post.valid?
      expect(post.errors[:title].size).to eq(1)
    end
    it 'should not have empty content' do
      post = build(:post, content: nil, user: build(:user))
      post.valid?
      expect(post.errors[:content].size).to eq(1)
    end
    it 'should have a user' do
      post = build(:post)
      post.valid?
      expect(post.errors[:user].size).to eq(1)
    end
    it 'should save a post with valid fields' do
      post = create(:post, user: build(:user))
      expect(post).to be_valid
    end
  end
end
