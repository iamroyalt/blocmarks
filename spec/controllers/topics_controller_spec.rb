require 'rails_helper'


RSpec.describe TopicsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }

  context "signed in user doing CRUD on an item" do

  before do
    my_user.confirm
    sign_in my_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: my_topic.id
      expect(response).to have_http_status(:success)
    end
  end
end
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    #it "renders new view" do
      #get :new
      #expect(response).to_have_http_status(:success)
    #end

    #it "instantiates @topic" do
      #expect(assigns(:topic)).not_to be_nil
    #end
  end

  describe "GET #edit" do
      it "returns http success" do
        get :edit, id: my_topic.id
        expect(response).to have_http_status(:success)
      end
    end

end
