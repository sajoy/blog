class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Thanks for commenting."
      redirect_to post_path(@post)
    else
      flash[:alert] = "So sorry, something went wrong. Try again."
      redirect_to :back
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
      flash[:notice] = "Your revised comment was submitted."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

private
  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
