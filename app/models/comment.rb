class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
    save
  end
end
