class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy
    redirect_to post_path(post)
  end

  
  private
  
  
  def comment_params
    params.require(:comment).permit(:content, :pic)
  end
end