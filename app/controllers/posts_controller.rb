class PostsController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    @posts = @user.posts
  end

  def show
    @posts = Post.where(author_id: @user.id)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
