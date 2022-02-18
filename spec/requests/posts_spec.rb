require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  context 'GET #index' do
    it 'is a success' do
      get posts_path
      expect(response).to have_http_status(:ok)
    end
  end

  def post_params(attributes)
    post posts_path, params: { post: attributes }
  end

  context 'Post #create' do
    it 'should create a post' do
      post_params attributes_for(:post)
      expect(response).to have_http_status(:found)
    end
    it 'should create a post without title' do
      post_params attributes_for(:post, title: nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'should create a post without content' do
      post_params attributes_for(:post, content: nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'Post #show' do
    it 'should show a post with valid slug' do
      post_params attributes_for(:post)
      get post_path(Post.first.slug)
      expect(response).to have_http_status(:ok)
    end
    it 'should not show a post if slug invalid' do
      slug = 'xyz'
      expect { get post_path(slug) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  def update_params(slug, attributes)
    put post_path(slug), params: { post: attributes }
  end

  context 'Post #update' do
    before(:each) do
      post_params attributes_for(:post)
    end
    it 'should update a post' do
      post_params attributes_for(:post)
      update_params Post.first.slug, attributes_for(:post)
      expect(response).to have_http_status(:found)
    end
    it 'should update a post with no title' do
      post_params attributes_for(:post)
      update_params Post.first.slug, attributes_for(:post, title: nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'should update a post with no content' do
      post_params attributes_for(:post)
      update_params Post.first.slug, attributes_for(:post, content: nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'Post #destroy' do
    it 'should destroy a post' do
      post_params attributes_for(:post)
      delete post_path(Post.first.slug)
      expect(response).to have_http_status(:found)
    end
    it 'should not delete post if slug invalid' do
      slug = 'xyz'
      expect { delete post_path(slug) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
