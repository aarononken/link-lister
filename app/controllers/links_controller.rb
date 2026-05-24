class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_link, only: [:show, :upvote, :downvote]

  def index
    @links = Link.order(cached_votes_score: :desc).includes(:user)
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user

    if @link.save
      redirect_to links_path, notice: "Link was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def upvote
    @link.upvote_by current_user
    redirect_to links_path, notice: "Upvoted!"
  end

  def downvote
    @link.downvote_by current_user
    redirect_to links_path, notice: "Downvoted!"
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end
end