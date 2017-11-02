class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post.id = (params[:id])
    @comment = Comment.new    
  end

  def new
    if !current_user.nil?
      @post_new = current_user.posts.new
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if !@post.title.blank? && @post.save
      flash[:notice] = "Post created successfully."
      redirect_to post_path(@post.id)
    else
      redirect_to new_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
    flash[:notice] = "Post deleted successfully."
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(params.require(:post).permit(:title))
        format.html { redirect_to post_path(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  
  def post_params
    params.require(:post).permit(:title, :pic)
  end
end