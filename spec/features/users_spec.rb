require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before(:each) do
    @user1 = FactoryBot.create(:user, name: 'Jacob', photo: 'https://i.pravatar.cc/300?img=1', bio: 'I am Jacob')
    @user2 = FactoryBot.create(:user, name: 'Kelvin', photo: 'https://i.pravatar.cc/300?img=2', bio: 'I am Kelvin')
    @user3 = FactoryBot.create(:user, name: 'Andrew', photo: 'https://i.pravatar.cc/300?img=3', bio: 'I am Andrew')
    FactoryBot.create(:post, author: @user1)
    FactoryBot.create(:post, author: @user2)
    FactoryBot.create(:post, author: @user3)
  end

  scenario 'I can see the usernames of all other users' do
    visit root_path
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end
end
