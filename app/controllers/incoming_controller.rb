class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])

    @url = params["body-plain"]
    #puts "INCOMING PARAMS HERE: #{params}"

    if @user.nil?
      @user = User.create(email: params[:sender], password: 'blocmarks2016', confirmed_at: Time.now)
    end

    if @topic.nil?
      @topic = Topic.create(title: params[:subject], user_id: @user)
    end

    @bookmark = @topic.bookmarks.create(url: @url)

    # Assuming all went well.
    head 200
  end
end
