class Comment < ApplicationRecord
  belongs_to :post

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
    save
  end
end
