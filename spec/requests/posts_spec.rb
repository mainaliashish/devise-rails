require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    before(:each) { get posts_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'Post #create' do
    it 'should creat a post' do
      post posts_path, params: { post: attributes_for(:post) }
      expect(response).to have_http_status(:found)
    end
    it 'should create a post without title' do
      post posts_path, params: { post: attributes_for(:post, title: nil) }
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'should create a post without content' do
      post posts_path, params: { post: attributes_for(:post, content: nil) }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'Post #show' do
    it 'should show a post with valid slug' do
      post posts_path, params: { post: attributes_for(:post) }
      post = Post.first
      get post_path(post.slug)
      expect(response).to have_http_status(:ok)
    end
    it 'should not show a post if slug invalid' do
      slug = 'xyz'
      expect { get post_path(slug) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'Post #update' do
    it 'should update a post' do
      post posts_path, params: { post: attributes_for(:post) }
      put post_path(Post.first.slug), params: { post: attributes_for(:post) }
      expect(response).to have_http_status(:found)
    end
    it 'should update a post with no title' do
      post posts_path, params: { post: attributes_for(:post) }
      put post_path(Post.first.slug), params: { post: attributes_for(:post, title: nil) }
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'should update a post with no content' do
      post posts_path, params: { post: attributes_for(:post) }
      put post_path(Post.first.slug), params: { post: attributes_for(:post, content: nil) }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
