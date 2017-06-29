require 'spec_helper'

describe "Workout Forms" do
  describe "/workouts/new" do
    before do
      visit '/workouts/new'
    end

    it "creates a new workout on submit" do
      exercise = Exercise.create(name: "Running")
      fill_in "Title", with: "Hill Repteats"
      fill_in "Date", with: "06/01/2017"
      fill_in "Duration(min)", with: 40
      check exercise.name
      fill_in "Note", "I am tired now."
      click_on "Create"

      expect(page).to have_content("Hill Repeats")
      expect(page).to have_content("06/01/2017")
      expect(page).to have_content(40)
      expect(page).to have_content(exercise.name)
      expect(page).to have_content("I am tired now.")
    end

    it "adds a new exercise on create a new workout" do
      expect {
        fill_in "Title", with: "100s"
        fill_in "Date", with: "06/01/2017"
        fill_in "Duration(min)", with: 40
        fill_in "Exercise", with: "Swimming"
        fill_in "Note", "I swam at the gym."
        click_on "Create"
      }.to change(Exercise, :count).by(1)
    end
  end
end
