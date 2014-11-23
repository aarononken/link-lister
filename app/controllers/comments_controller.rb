class CommentsController < ApplicationController
	before_action :require_user, only: [:create]
	before_action :require_admin, only: [:destroy]

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user

		if @comment.save
			redirect_to @comment.link, notice: "Nice comment!"
		else
			redirect_to @comment.link, alert: "Your comment didn't save!"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @comment.link, notice: "Comment buh-leted!"
	end

	def comment_params
		params.require(:comment).permit(:body, :link_id, :user_id)
	end
	
end