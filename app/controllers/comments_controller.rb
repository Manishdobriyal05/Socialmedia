class CommentsController < ApplicationController

  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  
  def show
    @comment = Comment.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
     redirect_to new_post_comment_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment_id = @comment.id
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :commentbox)
    end
end