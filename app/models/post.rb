class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
    save
  end

  def latest_comments
    comments.order(created_at: :desc).limit(5)
  end
end
