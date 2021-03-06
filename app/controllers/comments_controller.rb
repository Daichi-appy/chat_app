class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comments = @post.comments.all
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    comment.destroy
    redirect_to post_path(@post)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id).merge(user_id: current_user.id)
    end
end
