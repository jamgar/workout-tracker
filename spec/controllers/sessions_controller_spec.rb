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
  
    end
  end
end
