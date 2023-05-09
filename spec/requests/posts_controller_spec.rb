require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }

  describe 'GET /index' do
    it 'returns a success response' do
      get "/users/#{user.id}/posts"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template('index')
    end

    it 'response body includes the correct content' do
      get "/users/#{user.id}/posts"
      expect(response.body).to match(%r{<h1>List of all Posts by a user</h1>})
    end
  end

  describe 'GET /show' do
    it 'returns a success response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template('show')
    end

    it 'response body includes the correct content' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to match(%r{<h2>Details of post for a given ID</h2>})
    end
  end
end
