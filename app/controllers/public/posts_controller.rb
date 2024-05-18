class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def edit
    is_matching_login_user
  end

  def update
  end

  def destroy
    is_matching_login_user
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
  
  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
    if @post.save
      redirect_to post_path
    else
      render :new
    end
    end
  end
  
  
end
