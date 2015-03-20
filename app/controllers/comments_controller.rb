class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    if @comment.save
      flash[:notice] = "Thanks for commenting."
      redirect_to post_path(@post)
    else
      flash[:alert] = "So sorry, something went wrong. Try again."
      redirect_to :back
    else
    end
  end

  def edit
    @post = Post.find(params[:post_id])

  end

  def update
    @post = Post.find(params[:post_id])

  end

  def destroy
    @post = Post.find(params[:post_id])
  end

private
  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
