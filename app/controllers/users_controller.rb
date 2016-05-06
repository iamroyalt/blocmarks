class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def show
    if current_user.present?
      @user = params[:id] ? User.find(params[:id]) : current_user
      #@user = User.find(params[:id])
      @user_bookmarks = @user.bookmarks
      @liked_bookmarks = @user.liked_bookmarks
    else
      redirect_to new_user_registration_path
    end
  end

end
