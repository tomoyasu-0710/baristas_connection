class Public::CommentsController < ApplicationController
  
  before_action :set_commentable, only: [:show, :create, :destroy]
  
  def index
  end

  def show
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      redirect_to @commentable, notice: "コメントしました。"
    else
      redirect_to @commentable, alert: "コメントに失敗しました。"
    end
  end

  def destroy
     @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable, notice: "コメントを削除しました。"
  end
  
   private

  def set_commentable
    if params[:post_id]
      @commentable = Post.find(params[:post_id])
    elsif params[:group_id]
      @commentable = Group.find(params[:group_id])
    elsif params[:cupping_note_id]
      @commentable = CuppingNote.find(params[:cupping_note_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
