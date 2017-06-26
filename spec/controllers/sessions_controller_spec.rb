require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
  describe "Login Page" do
    before do
      get '/login'
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
      session.destroy
      params = {
        username: "testuser2",
        password: "test2'"
      }
      post '/login', params
      #follow_redirect!
      expect(session[:user_id]).to eq(2)
    end

    it "displays the correct username based on the session[:user_id]" do
      params = {
        username: "testuser3",
        password: "test3"
      }
      post '/login', params
      follow_redirect!
      expect(last_response.body).to include("Welcome testuser3")
    end
    
    it "show an message if the username or password are not a valid user" do
      params = {
        username: "testuser4",
        password: "xxx"
      }
      post '/login', params
      expect(last_response.body).to include("The Username or Password is incorrect. Try again.")
    end

  end

  describe "Log Out" do
    it "displays a 'Log Out' link" do
      params = {
       username: "testuser1",
        password: "test1"
      }
      post '/login', params
      follow_redirect!
      expect(last_response.body).to include('Log Out')
    end
  end
end
