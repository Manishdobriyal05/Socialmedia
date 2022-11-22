class PostsController < ApplicationController
  # before_action :set_post, only: %i[ show edit update destroy ]
  before_action :logged_in?

  
  def index
    @posts = Post.all.order(created_at: :desc).with_attached_images
  end

  def show
    @post = Post.find(params[:id])
  end


  def new
    @post = Post.new
  end
  
  
  def create
    # Post.create(post_params)
    @post = Post.new(post_params)
    @post.user_id = current_user.id     # current_user_id is Associated with post id 
    # current_user.posts.create(post_params)
    if @post.save 
      redirect_to posts_path
      # redirect_to @post
    else
      render :new

    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, status: :see_other
  end


  private
   
  def post_params
    params.require(:post).permit(:username, :body, :images)
  end
end
