require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get '/users'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'response body includes the correct content' do
      get '/users'
      expect(response.body).to match(%r{<h1>This is the lists of all users in the application</h1>})
    end
  end

  describe 'GET /show' do
    it 'returns a success response' do
      get '/users/1'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users/1'
      expect(response).to render_template('show')
    end
  end
end
