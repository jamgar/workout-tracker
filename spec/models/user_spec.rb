require 'spec_helper'

describe 'User' do
  before do
    @user = User.create(username: "testuser", email: "testuser@exmaple.com", password: "test")
  end
  
  it 'has a secure password' do
    expect(@user.authenticate("wrong")).to eq(false)
    expect(@user.authenticate("test")).to eq(@user)
  end
end