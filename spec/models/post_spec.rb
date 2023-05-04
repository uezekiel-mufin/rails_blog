require 'rails_helper'

RSpec.describe Post, type: :model do
  include Shoulda::Matchers::ActiveModel
  let(:author) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:post, author:) }

  before do
    FactoryBot.create_list(:comment, 7, post: subject)
  end

  describe 'Validations' do
    it 'requires a title to be present' do
      expect(subject.title).to be_truthy
    end

    it 'requires a title to be not more than 250 characters' do
      expect(subject.title.length).to be <= 250
    end

    it 'requires comment_counter to be greater than or equal to zero' do
      expect(subject.comments_counter).to be >= 0
    end

    it 'requires comment_counter to be an integer' do
      expect(subject.comments_counter).to be_a(Integer)
    end

    it 'requires likes_counter to be greater than or equal to zero' do
      expect(subject.likes_counter).to be >= 0
    end

    it 'requires likes_counter to be an integer' do
      expect(subject.likes_counter).to be_a(Integer)
    end
  end

  describe '#latest_comments' do
    it 'returns an array' do
      expect(subject.latest_comments).to be_a(Array)
    end
    it 'returns an array of length 5' do
      expect(subject.latest_comments.count).to eq(5)
    end
  end

  describe '#update_posts_counter' do
    it 'updates the posts_counter of the author' do
      expect(subject.author.posts_counter).to eq(1)
    end
  end
end
