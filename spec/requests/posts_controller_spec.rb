require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do
  let (:user) { FactoryBot.create(:user) }
  let (:post) { FactoryBot.create(:post, 3, author: user) }

  describe "GET /users/:user_id/posts" do
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
      expect(response.body).to match(/<h2>List of posts by a given user<\/h2>/)
    end
  end
end
