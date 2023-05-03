class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
