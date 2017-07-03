require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome to Workout Tracker")
      expect(last_response.body).to include("<a href=\"/signup\">SignUp</a>")
      expect(last_response.body).to include("<a href=\"/login\">LogIn</a>")
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
