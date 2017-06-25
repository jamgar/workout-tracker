require 'spec_helper'

RSpec.describe User, type: :model do

  context "validations" do
    it "is invalid without a username" do
      expect(User.create(username: nil, email: "testuser@example.com", password: "test")).to_not be_valid
    end
  end
  
  # before do
  #   @user = User.create(username: "testuser", email: "testuser@exmaple.com", password: "test")
  # end
  
  # it 'has a secure password' do
  #   expect(@user.authenticate("wrong")).to eq(false)
  #   expect(@user.authenticate("test")).to eq(@user)
  # end
end