class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all
  end

  def new
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @posts = Post.all
  end

  def update
    @posts = Post.all
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy # The "destroy" method takes the passed id, fetches the model from the database using the "find" method, then calls destroy on that.
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path, notice:  "The evidence for #{@post.title} has been deleted."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :image2)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
