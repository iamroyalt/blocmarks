class BookmarksController < ApplicationController

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was saved"
      redirect_to [@topic, @bookmark]
     else
      flash.now[:alert] = "Bookmark was not saved. Please try again."
      render :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark Deleted"
      redirect_to request.referrer
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

end

private

def bookmark_params
  params.require(:bookmark).permit(:url, :name)
end
