class PostsController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
