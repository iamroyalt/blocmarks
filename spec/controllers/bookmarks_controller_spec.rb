require 'rails_helper'


describe BookmarksController do

  let(:my_topic)    { create(:topic) }
  let(:my_user)     { create(:user) }
  let(:my_bookmark) { create(:bookmark, topic: my_topic, user: my_user) }

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
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end
end
