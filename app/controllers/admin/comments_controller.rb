class Admin::CommentsController < ApplicationController
  
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @comments = Comment.includes(:user).all
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path
  end
  
end
