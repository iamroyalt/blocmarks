require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:topic) { create(:topic) }


  before do
    sign_in my_user

  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Topic.all to topic" do
      get :index
      expect(assigns(:topics)).to include(my_topic)
    end
  end

  describe "POST #create" do

    it "create a new topic" do
      expect{ post :create, user_id: user.id, topic: {title: 'new title'} }.to change{ Topic.count }.by(1)
      expect(response).to have_http_status(302)
      expect( Topic.last.title ).to eq( 'new title' )
    end

    it "topic already exist" do
      expect{ post :create, user_id: user.id, topic: {title: 'title'} }.to change{ Topic.count }.by(0)
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE #destroy" do
    it "detele a topic" do
      expect{ delete :destroy, id: topic.id }.to change{ Topic.count }.by(-1)
      expect(response).to have_http_status(302)
    end
  end

end
