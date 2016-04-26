class UserController < ApplicationController
before_action :authenticate_user!
@user = User.find(params[:id])
@user_bookmarks = @user.bookmarks
end
