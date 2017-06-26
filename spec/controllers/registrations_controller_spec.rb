require 'spec_helper'

RSpec.describe RegistrationsController, type: :controller do

  describe "Signup Page" do
    before do
      get '/signup'
    end
    
    it 'loads the signup page' do
      expect(last_response.status).to eq(200)  
      expect(last_response.body).to include("username")
      expect(last_response.body).to include("email")
      expect(last_response.body).to include("password")
      expect(last_response.body).to include("Submit")
    end

    it 'allows a user to signup and direct them to their workouts' do
      params = {
        username: "testuser",
        email: "testuser@example.com",
        password: "test"
      }
      post '/signup', params
      expect(last_response.location).to include('/workouts')
    end

    it 'does not allow user to signup without a username' do
      params = {
        username: "",
        email: "testuser@example.com",
        password: "test"
      }
      post '/signup', params
      expect(last_request.path).to eq('/signup')
      expect(last_response.body).to include("All fields are required.")
    end

    it 'does not allow user to signup without a email' do
      params = {
        username: "testuser",
        email: "",
        password: "test"
      }
      post '/signup', params
      expect(last_request.path).to eq('/signup')
      expect(last_response.body).to include("All fields are required.")
    end

    it 'does not allow user to signup without a password' do
      params = {
        username: "testuser",
        email: "testuser@example.com",
        password: ""
      }
      post '/signup', params
      expect(last_request.path).to eq('/signup')
      expect(last_response.body).to include("All fields are required.")
    end

  end
end
