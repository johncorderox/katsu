class PostsController < ApplicationController
  def index
    @post = Post.joins(:user).select("posts.id AS posts_id, posts.title, posts.category, users.id AS users_id, users.username").order("posts.id DESC")
  end

  def create
    @new_post = Post.new(new_post)
    if @new_post.save
      redirect_to posts_path
    else
      redirect_to :back
      flash[:alert] = "All Fields Are Required!"
    end
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.where(post_id: params[:id]).order("comments.id DESC")
  end

  def destroy
    @post_delete = Post.find(params[:id]).delete
    redirect_to posts_path
  end

  def addcomment
    @new_comment = Comment.new(new_comment)
    if @new_comment.save
      redirect_to :back
    else
      flash[:alert] = "Comment is needed!"
      redirect_to :back
    end
  end

  private
    def new_post
     params.require(:post).permit(:title, :category, :content, :user_id)
   end

   def new_comment
     params.require(:comment).permit(:comment, :user_id, :post_id)
   end
end
