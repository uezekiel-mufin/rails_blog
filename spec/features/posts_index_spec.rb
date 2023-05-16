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
  describe 'Posts Index' do
    scenario 'I can see the user\'s profile picture' do
      visit user_posts_path(@user1.id)
      expect(page).to have_selector("img[src='https://i.pravatar.cc/300?img=1']")
    end

    scenario 'I can see the user\'s name' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.name)
    end

    scenario 'I can see the number of posts of the user' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.posts_counter)
    end

    scenario 'I can see a post\'s title' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.posts.first.title)
    end

    scenario 'I can see a post\'s body' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.posts.first.body)
    end

    scenario 'I can see the first comment on a post' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.posts.first.comments.first.body)
    end

    scenario 'I can see how many comments a post has' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.posts.first.comments_counter)
    end

    scenario 'I can see how many likes a post has' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content(@user1.posts.first.likes_counter)
    end

    scenario 'If i click on a post, it directs me to the post\'s show page' do
      visit user_posts_path(@user1.id)
      click_on @user1.posts.first.title
      expect(page).to have_current_path(user_post_path(@user1.id, @user1.posts.first.id))
    end
    scenario 'I can see a section for pagination if there are more posts than fit on the view' do
      visit user_posts_path(@user2)
      expect(page).to have_selector('div.flickr_pagination a')
    end
  end
end
# rubocop:enable Metrics/BlockLength
