class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
    save
  end

  def latest_comments
    comments.order(created_at: :desc).limit(5)
  end
end
