require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author:) }
  let(:subject) { FactoryBot.create(:comment, author:, post:) }

  # before do
  #   FactoryBot.create(:comment, author: author, post: post)
  # end

  describe 'Validations' do
    it 'requires a body to be present' do
      expect(subject.body).to be_truthy
    end
  end

  describe '#update_comments_counter' do
    it 'updates the comments_counter of the post' do
      expect(subject.post.comments_counter).to eq(1)
    end
  end
end
