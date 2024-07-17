class Public::CommentsController < ApplicationController
  def index
  end

  def show
    @commentable = find_commentable
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: "コメントしました。"
    else
      redirect_to @commentable, alert: "コメントに失敗しました。"
    end
  end

  def destroy
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
    if current_user.id == @comment.user.id
      @comment.destroy
     redirect_to @commentable, notice: "コメントを削除しました。"
    else
      render "posts/show"
    end
  end

  private

  def find_commentable
    if params[:post_id]
      Post.find(params[:post_id])
    elsif params[:group_id]
      Group.find(params[:group_id])
    elsif params[:cupping_note_id]
      CuppingNote.find(params[:cupping_note_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
