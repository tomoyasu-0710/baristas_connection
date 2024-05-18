class Public::LikesController < ApplicationController
  
  def create
    post = Post.find(params[:id])
    cupping_note = Cupping_note.find(params[:id])
    comment = Comment.find(params[:id])
    like = current_user.likes.new(post_id: post.id)
    like.save
    redirect_to post_path(post)
  end
  
  def destroy
    post = Post.find(params[:id])
    cupping_note = Cupping_note.find(params[:id])
    comment = Comment.find(params[:id])
    like = current_user.likes.find_by(post_id: post.id)
    like.destroy
    redirect_to post_path(post)
  end
end
