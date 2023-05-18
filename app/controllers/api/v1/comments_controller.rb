class Api::V1::CommentsController < ActionController::API
  load_and_authorize_resource
  before_action :set_post, only: %i[index create]

  def index
    @comments = @post.comments.includes(:author)
    render json: {success: true, data: { comments: @comments } }
  end

  def create
    body = comment_params
    @comment = Comment.new(body:, post: @post, author: current_user)
    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to user_post_path(@post.author, @post)
    else
      flash[:alert] = "Comment couldn't be created"
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])

    raise ActiveRecord::RecordNotFound if @post.nil?

  end
      # Handle ActiveRecord::RecordNotFound exception
  rescue_from ActiveRecord::RecordNotFound do
    render json: { success: false, message: 'Post not found' }, status: :not_found
  end
  end