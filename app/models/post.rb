class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  after_save :update_posts_counter

  def latest_comments
    comments.includes([:author]).order(created_at: :desc).limit(5).to_a
  end

  private

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
