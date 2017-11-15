class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all
    redirect_to action: :index
  end

  def admin
    @posts = Post.all
    @post = Post.new
  end

  def new #New objects can be instantiated as either empty or pre-set with attributes but not yet saved (pass a hash with key names
          #matching the associated table column names). In both instances, valid attribute keys are determined by the
          #column names of the associated table – hence you can’t have attributes that aren’t part of the table columns.
    @posts = Post.all
    @post = Post.new
  end

  def create #Creates an object (or multiple objects) and saves it to the database, if validations pass.
             #The resulting object is returned whether the object was saved successfully to the database or not.
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

  def update #Updates the attributes of the model from the passed-in hash and saves the record, all wrapped in a transaction.
             #If the object is invalid, the saving will fail and false will be returned. Also aliased as: update_attributes
    @posts = Post.all
    if @post.update_attributes(post_params)
      redirect_to post_path(@post), notice:  "The evidence for #{@post.title} has been edited."
    else
      render :edit
    end
  end

  def destroy #The "destroy" method takes the passed id, fetches the model from the database using the "find" method,
              #then calls destroy on that.
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
