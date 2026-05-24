class CommentsController < ApplicationController
  before_action :require_user, only: [:create]
  before_action :require_admin, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @comment.link, notice: "Nice comment!"
    else
      redirect_to @comment.link, alert: "Your comment didn't save!", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    link = @comment.link
    @comment.destroy
    redirect_to link, notice: "Comment deleted!"
  end

  private

  def comment_params
    # Security fix: Remove :user_id from permitted params to prevent mass-assignment vulnerability
    params.require(:comment).permit(:body, :link_id)
  end
end