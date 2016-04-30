require 'rails_helper'


describe BookmarksController do

  let (:my_topic) {create(:topic)}
  #let (:my_user) {create(:user)}
  let (:my_bookmark) {create(:bookmark, topic: my_topic)}

  before(:each) do
    sign_in my_user
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to have_http_status(:success)
    end

     it "renders the show view" do
      get :show, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to render_template :show
    end

    it "assigns my_bookmark to @bookmark" do
      get :show, topic_id: my_topic.id, id: my_bookmark.id
      expect(assigns(:bookmark)).to eq(my_bookmark)
    end
  end

    describe "GET #new" do
      it "returns http success" do
        get :new, topic_id: my_topic.id, id: my_bookmark.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end
end
