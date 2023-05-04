# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  include Shoulda::Matchers::ActiveModel
  let(:subject) { FactoryBot.create(:user) }

  before do
    FactoryBot.create_list(:post, 3, author: subject)
  end

  describe 'Validations' do
    it 'requires a name to be present' do
      expect(subject.name).to be_truthy
    end

    it 'requires a name to be present' do
      expect(subject).to validate_presence_of(:name)
    end
  end

  describe '#recent_posts' do
    it 'requires a posts_counter to be greater than or equal to 0' do
      expect(subject.posts_counter).to be >= 0
    end

    it 'returns an array' do
      expect(subject.recent_posts).to be_a(Array)
    end

    it 'returns an array of 3 recent posts' do
      expect(subject.recent_posts.count).to eq(3)
    end
  end
end
