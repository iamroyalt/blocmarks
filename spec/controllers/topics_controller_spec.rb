require 'rails_helper'


RSpec.describe TopicsController, type: :controller do
  let(:my_user) { create(:user, email: Faker::Internet.email, confirmed_at: Time.now) }
  let(:my_topic) { create(:topic) }

  include Devise::TestHelpers

  context "signed in user doing CRUD on an item" do

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
        expect{ post :create, topic: {title: 'new title'} }.to change{ Topic.count }.by(1)
        expect(response).to have_http_status(302)
        expect( Topic.last.title ).to eq( 'MyString' )
      end
    end

    describe "DELETE #destroy" do
      it "deletes the topic" do
         delete :destroy, {id: my_topic.id}
         count = Topic.where({id: my_topic.id}).size
         expect(count).to eq 0
      end
    end

    describe "GET #show" do
      it "returns http success" do
       get :show, {id: my_topic.id}
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
        get :edit, id: my_topic.id
        expect(response).to have_http_status(:success)
      end
    end

  end

end
