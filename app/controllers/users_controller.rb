class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    puts @user.recent_posts.inspect
  end

end
