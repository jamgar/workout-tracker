require 'spec_helper'

RSpec.describe RegistrationsController, type: :controller do

  describe "Signup Page" do
    before do
      get '/signup'
    end
    
    it 'loads the signup page' do
      expect(last_response.status).to eq(200)  
    end

    it 'allows a user to signup and direct them to their dashboard'
      params = {
        username: "testuser",
        email: "testuser@example.com",
        password: "test"
      }
      post '/signup', params
      expect(last_response.location).to include("/workouts")
    end
    
  end
  
end
