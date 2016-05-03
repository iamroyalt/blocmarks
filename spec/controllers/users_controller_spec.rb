require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:my_user)  { create(:user, email: Faker::Internet.email, confirmed_at: Time.now) }

  include Devise::TestHelpers

  before do
    #user = User.create(email: "tracy@bloccitoff.com", password: "helloworld", password_confirmation: "helloworld", confirmed_at: Time.now)
    sign_in my_user
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_user.id}
      expect(response).to have_http_status(:success)
    end
  end

end
