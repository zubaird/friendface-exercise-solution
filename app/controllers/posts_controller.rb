class PostsController < ApplicationController

  def index
    @user = User.find_by_id(params[:user_id])
  end

  def new
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_posts_path(@user)
  end

private

  def post_params
    params.require(:post).permit(
      :content
    )
  end

end
