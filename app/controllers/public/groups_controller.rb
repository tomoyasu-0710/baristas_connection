class Public::GroupsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
    @user = User.find(current_user.id)
  end

  def show
    @group = Group.find(params[:id])
    @user = User.find(current_user.id)
  end

  def create
    @group = Group.new(group_params)
    # 誰が作ったグループかを判断。
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  def destroy
  end
  
  private

  def group_params
    params.require(:group).permit(:title, :body, :image)
  end
  
  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
  
end
