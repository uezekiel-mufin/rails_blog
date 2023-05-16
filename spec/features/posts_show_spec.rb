# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before(:each) do
    @user1 = FactoryBot.create(:user, name: 'Jacob', photo: 'https://i.pravatar.cc/300?img=1', bio: 'I am Jacob')
    @user2 = FactoryBot.create(:user, name: 'Kelvin', photo: 'https://i.pravatar.cc/300?img=2', bio: 'I am Kelvin')
    @user3 = FactoryBot.create(:user, name: 'Andrew', photo: 'https://i.pravatar.cc/300?img=3', bio: 'I am Andrew')
    FactoryBot.create(:post, author: @user1)
    15.times { FactoryBot.create(:post, author: @user2) }
    FactoryBot.create(:post, author: @user3)
    FactoryBot.create(:comment, post: @user1.posts.first, author: @user2)
    FactoryBot.create(:comment, post: @user1.posts.first, author: @user3)
    FactoryBot.create(:comment, post: @user2.posts.first, author: @user1)
    FactoryBot.create(:comment, post: @user2.posts.first, author: @user3)
  end

  describe 'Posts Show' do
    scenario 'I can see the post title' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content(@user1.posts[0].title)
    end

    scenario 'I can see who wrote the post' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content(@user1.name)
    end

    scenario ' I can see how many comments the post has' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content(@user1.posts.first.comments_counter)
    end

    scenario 'I can see how many likes the post has' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content(@user1.posts.first.likes_counter)
    end

    scenario 'I can see the body of the post' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content(@user1.posts.first.body)
    end

    scenario 'I can see the username of each commentor' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end

    scenario 'I can see the comment by each commentor' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content(@user2.comments.first.body)
    end
  end
end
# rubocop:enable Metrics/BlockLength
