class Api::V1::CommentsController < ActionController::API
  load_and_authorize_resource

  def index
    @comments = @post.comments.paginate(page: params[:page], per_page: 2)
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

  end