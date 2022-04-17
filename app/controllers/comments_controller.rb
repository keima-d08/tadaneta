class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_back fallback_location: @post
    end
  end

  def destroy
    comments = Comment.find(params[:id])
    comments.destroy
    redirect_back fallback_location: @post
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
