class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:show, :edit, :update]
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
    if current_user.guest?
      flash[:alert] = "ゲストユーザーは編集できません。"
      redirect_to edit_user_path(current_user)
    else
      if @user.update(user_params)
        redirect_to user_path(current_user)
      else
        render :edit
      end
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
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end

end
