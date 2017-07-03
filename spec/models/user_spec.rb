require 'spec_helper'
<<<<<<< HEAD

=======
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
RSpec.describe User, type: :model do

  context "validations" do
    it "is invalid without a username" do
      expect(User.create(username: nil, email: "testuser@example.com", password: "test")).to_not be_valid
    end

    it "is invalid without a email" do
      expect(User.create(username: "testuser", email: nil, password: "test")).to_not be_valid
    end

    it "is invalid without a password" do
      expect(User.create(username: "testuser", email: "testuser@example.com", password: nil)).to_not be_valid
    end
  end
  
  context "attributes" do
    let(:user) {User.create(username: "testuser", email: "testuser@exmaple.com", password: "test")}
    it "has a username" do
      expect(user.username).to eq("testuser")
    end

    it "has a email" do
      expect(user.email).to eq("testuser@exmaple.com")
    end

    it "has a secure password" do
      expect(user.authenticate("wrong")).to eq(false)
      expect(user.authenticate("test")).to eq(user)
    end
  end
end