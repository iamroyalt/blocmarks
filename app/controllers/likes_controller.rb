class LikesController < ApplicationController

  after_action :verify_authorized

  def index
    likes = Like.all
  end

  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     #@topic = @bookmark.topic
     like = current_user.likes.build(bookmark: @bookmark)
     authorize like
     if like.save
       flash[:notice] = "Bookmark liked"
       redirect_to [@bookmark.topic]
     else
       flash[:alert] = "Error. Please try again."
       redirect_to [@bookmark.topic, @bookmark]
     end
   end

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     @topic = @bookmark.topic
     like = current_user.likes.find(params[:id])
     authorize like

     if like.destroy
       flash[:notice] = "Bookmark unliked"
       redirect_to @bookmark
     else
       flash[:alert] = "Error. Please try again"
       redirect_to @bookmark
     end
   end
end
