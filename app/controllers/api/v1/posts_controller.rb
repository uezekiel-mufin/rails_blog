class Api::V1::PostsController < ActionController::API
load_and_authorize_resource
before_action :set_user, only: %i[index show]

  def index
    if @user.nil?
      render json: {success: false, message: 'User not found'}
    else
      @posts = @user.posts.includes(:comments)
      render json: {success: true, data: { posts: @posts } }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
   # Raise ActiveRecord::RecordNotFound if user is not found
   raise ActiveRecord::RecordNotFound if @user.nil?
  end

  # Handle ActiveRecord::RecordNotFound exception
  rescue_from ActiveRecord::RecordNotFound do
    render json: { success: false, message: 'User not found' }, status: :not_found
  end
end
