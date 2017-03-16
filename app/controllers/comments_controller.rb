class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @comment = @post.comment.create(comment_params)
    @comment.user_id = current_user.id
    do_it @comment.save
  end

  def destroy
    @comment = @post.comment.find(params[:id])
    @comment.destroy
    do_it @comment.destroy
  end

  private
  def do_it something_to_do_it
    something_to_do_it ? redirect_to(@post) : flash.now[:danger] = 'error'
  end

  def set_post 
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
