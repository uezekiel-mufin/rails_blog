require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author:) }
  let(:subject) { FactoryBot.create(:like, author:, post:) }

  describe 'Validations' do
    it 'requires a user to be present' do
      expect(subject.author).to be_truthy
    end

    it 'requires a post to be present' do
      expect(subject.post).to be_truthy
    end
  end

  describe '#update_likes_counter' do
    it 'updates the likes_counter of the post' do
      expect(subject.post.likes_counter).to eq(1)
    end
  end
end
