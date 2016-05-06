require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let (:my_topic) {create(:topic)}
  let (:my_user) { create(:user, email: Faker::Internet.email, confirmed_at: Time.now) }
  let(:my_bookmark) { create(:bookmark, topic: my_topic, user: my_user) }

  include Devise::TestHelpers

  context "signed in user doing CRUD on an item" do

    before do
      sign_in my_user
    end

  describe "POST create"
    it "redirects to the bookmarks show view" do
      post :create, {bookmark_id: my_bookmark.id}
      expect(response).to redirect_to(my_topic)
    end

    it "creates a like for the current user and specified bookmark" do
      expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).to be_nil
      post :create, {bookmark_id: my_bookmark.id}
      expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).not_to be_nil
    end

  describe "DELETE destroy"
    it "redirects to the bookmarks show view" do
      my_user.likes.where(bookmark_id: my_bookmark.id)
      delete :destroy, {bookmark_id: my_bookmark.id}
      expect(response).to redirect_to(my_topic)
    end

    it "deletes a like for the current user and specified bookmark" do
      my_user.likes.where(bookmark_id: my_bookmark.id)
      expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).not_to be_nil
      delete :destroy, {bookmark_id: my_bookmark.id}
      expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).to be_nil
    end
  end
end
