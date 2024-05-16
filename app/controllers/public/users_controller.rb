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


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
