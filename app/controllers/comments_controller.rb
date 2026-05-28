class CommentsController < ApplicationController
  before_action :require_user, only: [:create]
  before_action :require_admin, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @comment.link, notice: "Comment added!"
    else
      redirect_to @comment.link, alert: "Comment couldn't be saved."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    link = @comment.link
    @comment.destroy
    redirect_to link, notice: "Comment deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end
end
