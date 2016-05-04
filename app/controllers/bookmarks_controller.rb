class BookmarksController < ApplicationController

  before_action :authenticate_user!
  #after_action :verify_authorized, :except => :index

  def show
    @bookmark = Bookmark.find(params[:id])

  end

  def edit
    @bookmark = Bookmark.find(params[:id])

  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.url = params[:bookmark][:url]
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark updated"
      redirect_to topic_bookmark_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark][:url]
    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic
    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved"
      redirect_to [@topic]
     else
      flash.now[:alert] = "Bookmark was not saved. Please try again."
      render :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted"
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

private 

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
