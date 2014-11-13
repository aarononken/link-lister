class LinksController < ApplicationController
	before_action :require_user, only: [:new, :create]

	def index
		@links = Link.all
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

	def link_params
    	params.require(:link).permit(:title, :url)
	end
  
end