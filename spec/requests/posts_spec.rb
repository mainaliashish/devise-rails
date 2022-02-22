require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) { get posts_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }

    before(:each) do
      sign_in user
    end

    context 'performing Create, Update and Destroy' do
      it 'should create a post without title' do
        post = attributes_for(:post)
        post posts_path, params: { post: post, user: user }
        # binding.break
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
