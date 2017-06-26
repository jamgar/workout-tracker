require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
  describe "Login Page" do
    before do
      get '/'
    end

    it 'loads the login page' do
      expect(last_response.status).to eq(200)
    end

    it 'contains login fields' do
      expect(last_response.body).to include("username")
      expect(last_response.body).to include("password")
      expect(last_response.body).to include("Submit")
    end
  end

  describe "Sign In" do
    before do
      @user1 = User.create(username: "testuser1", email: "testuser1@example.com", password: "test1")
      @user2 = User.create(username: "testuser2", email: "testuser2@example.com", password: "test2")
      @user3 = User.create(username: "testuser3", email: "testuser3@example.com", password: "test3")
    end

    it "returns a 302 redirect status code" do
      params = {
        username: "testuser1",
        password: "test1"
      }
      post '/login', params
      expect(last_response.status).to eq(302)
    end

    it "sets session[:user_id] equal to id of the user" do
      params = {
        username: "testuser2",
        password: "test2'"
      }
      post '/login', params
      expect(session[:user_id]).to eq(2)
    end
  end
end
