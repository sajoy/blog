class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Thanks for commenting. Why not write your own post?"
          redirect_to post_path(@post)
        end
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = "Your thoughts are worth reading. Don't leave those fields empty."
        end
        render :new
      end
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "The best revisions add smiley faces."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Your thoughts are worth sharing. Don't leave those fields empty."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted. It's now lost to the wilderness of tangled web."
    redirect_to post_path(@post)
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
