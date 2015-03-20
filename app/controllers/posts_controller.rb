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
      flash[:alert] = "You came here with something to say, so say it."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "The most important part of writing is revision. Kudos to you."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Yes, less is more, but saying nothing is unacceptable. Please don't leave fields empty."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted. It's now lost to the wilderness of tangled web."
    redirect_to posts_path
  end


private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
