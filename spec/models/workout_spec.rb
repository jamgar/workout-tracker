require 'spec_helper'

RSpec.describe Workout, type: :model do

  context "validations" do
    it "is invalid without a title" do
      expect(Workout.create(title: nil, date: "06/12/2017")).to_not be_valid
    end

    it "is invalid without a date" do      
      expect(Workout.create(title: "Running", date: "")).to_not be_valid
    end
  end
  
  context "attributes" do
    before do
      @user = User.create(username: "testuser1", email: "testuser1@example.com", password: "test")
      @workout = Workout.create(title: "Running", date: "06/12/2017", note: "Had a great run.", user: @user)
      exercise1 = Exercise.create(name: "Running")
      exercise2 = Exercise.create(name: "Yoga")

      @workout.exercises << exercise1
      @workout.exercises << exercise2

    end

    it "can initialize a workout" do
      expect(@workout.id).to eq(1)
    end

    it "belongs to user" do
      expect(@workout.user).to eq(@user)
    end

    it "has many exercises" do
      expect(@workout.exercises.count).to eq(2)
    end
  end
end