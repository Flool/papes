class CommentsController < ApplicationController

  def create
    @comment = Comment.new(content: params[:comment][:content])
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy
    redirect_to post_path(post)
  end

  
end