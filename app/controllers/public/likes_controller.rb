class Public::LikesController < ApplicationController

  def create
  if params[:post_id]
    post = Post.find(params[:post_id])
    like = current_user.likes.new(likeable_id: post.id, likeable_type: "Post")
    like.save
    redirect_to post_path(post)
  elsif params[:cupping_note_id]
    cupping_note = Cupping_note.find(params[:cupping_note_id])
    like = current_user.likes.new(likeable_id: cupping_note.id, likeable_type: "Cupping_note")
    like.save
    redirect_to cupping_note_path(cupping_note)
  elsif params[:comment_id]
    comment = Comment.find(params[:comment_id])
    like = current_user.likes.new(likeable_id: comment.id, likeable_type: "Comment")
    like.save
    redirect_to comment_path(comment)
  end
  end

  def destroy
    if params[:post_id]
      post = Post.find(params[:post_id])
      like = current_user.likes.find_by(likeable_id: post.id, likeable_type: "Post")
      like.destroy
      redirect_to post_path(post)
    elsif params[:cupping_note_id]
      cupping_note = Cupping_note.find(params[:cupping_note_id])
      like = current_user.likes.find_by(likeable_id: cupping_note.id, likeable_type: "Cupping_note")
      like.destroy
      redirect_to cupping_note_path(cupping_note)
    elsif params[:comment_id]
      comment = Comment.find(params[:comment_id])
      like = current_user.likes.find_by(likeable_id: comment.id, likeable_type: "Comment")
      like.destroy
      redirect_to comment_path(comment)
    end
  end
end