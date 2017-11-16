class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    redirect_to action: :index
  end

  def admin
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

  def user_edit
    @post = Post.find params[:id]
    @posts = Post.all
  end

  def update
    @posts = Post.all
    if @post.update_attributes(post_params)
      redirect_to post_path(@post), notice:  "The evidence for #{@post.title} has been edited."
    else
      render :edit
    end
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path, notice:  "The evidence for #{@post.title} has been deleted."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :image2, :adminComment, :adminChecked)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
