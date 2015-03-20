class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = "Thanks for posting. Your thoughts are awesome. Share again soon!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "So sorry, something went wrong. Try again."
      redirect_to :back
    end
  end

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
