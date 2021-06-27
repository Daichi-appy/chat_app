class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all   
    @comment = Comment.new  
  end

  def create
    @post = Post.create(user_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path, alert: "投稿を削除しました"
  end

  private
    def user_params
      params.require(:post).permit(:title, :body)
    end
end
