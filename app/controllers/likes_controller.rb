class LikesController < ApplicationController
  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    if @like.save
      flash.now[:success] = 'You just liked this post...'
      redirect_to user_post_path(@like.post.author, @like.post)
    else
      flash[:alert] = 'Like unsuccessful...'
    end
  end
end
