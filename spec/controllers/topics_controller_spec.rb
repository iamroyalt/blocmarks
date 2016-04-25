require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let (:my_topic) {create(:topic)}
  let (:user) {create(:user)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders new view"
      get :new
      expect(response).to_have_http_status(:success)
    end

    it "instantiates @topic" do
      expect(assigns(:topic)).not_to be_nil
    end

    end
  end

  descripe "POST create" do
    it "increases the number of topic by 1" do
      expect{post :create, topic: {title: "My Title"}}.to change (Topic, :county).by(1)
    end

    it "assigns the new topic to @topic" do
      post :create, topic: {title: "My Title"}
      expect(assigns(:topic)). to eq Topic.last
    end

    it "redirects to the topics index" do
      post :create, topic: {title: "My Title"}
      expect(response).to redirect_to topics_path
    end
  end


end
