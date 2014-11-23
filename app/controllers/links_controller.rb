class LinksController < ApplicationController

	def upvote
		@link = Link.find(params[:id])
		@link.upvote_by current_user
		redirect_to links_path
	end

	def downvote
		@link = Link.find(params[:id])
		@link.downvote_by current_user
		redirect_to links_path
	end
  
	def index
		@links = Link.order(cached_votes_score: :desc)
	end

	def new
		@link = Link.new
	end

	def create
		@link = Link.new(link_params)
		@link.user = current_user

		if @link.save
			redirect_to links_path
		else
			render :new
		end
	end

	def show
		@link = Link.find(params[:id])
	end

	def link_params
		params.require(:link).permit(:title, :url)
	end
  
end