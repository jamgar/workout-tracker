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
      @user = User.create(username: "testuser1", email: "testuser1@example.com", password: "test")
    end

    it 'does not let user login with bad credentials' do
      params = {
        username: "testuser1",
        password: "xxxxx"
      }
      post '/login', params
      expect(last_response.location).to include("/login")
    end

    it 'load the workouts index page after login' do
      params = {
        username: "testuser1",
        password: "test"
      }
      post '/login', params
      expect(last_response.status).to eq(302)
      follow_redirect!
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome,")
    end

    it 'does not let user view login page if already logged in' do
      params = {
        username: "testuser1",
        password: "test"
      }
      post '/login', params
      session = {}
      session[:user_id] = @user.id
      get '/login'
      expect(last_response.location).to include("/workouts")
    end
    
  end

  describe "Log Out" do
    it "redirects to '/login' after lougout" do
      user = User.create(username: "testuser1", email: "testuser1@example.com", password: "test1")
       params = {
       username: "testuser1",
        password: "test1"
      }
      post '/login', params    
      get '/logout'
      follow_redirect!
      expect(last_request.path_info).to eq("/login")
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
