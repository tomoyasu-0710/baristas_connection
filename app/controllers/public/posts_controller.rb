class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @post = Post.all
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
