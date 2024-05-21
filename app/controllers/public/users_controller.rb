class Public::UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(current_user)
    else
    render :edit
    end
  end

  def destroy
  end

  def posts
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def likes
    @user = User.find(params[:user_id])
    @posts = @user.like_posts
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
