require 'spec_helper'

describe "Workout Forms" do
  describe "/workouts/new" do
    before do
      @exercise = Exercise.create(name: "Running")
      visit '/workouts/new'
    end

    it "creates a new workout on submit" do
      fill_in "title", with: "Hill Repteats"
      fill_in "date", with: "06/01/2017"
      fill_in "duration", with: 40
      check @exercise.name
      fill_in "note", "I am tired now."
      click_on "Create"

      expect(page).to have_content("Hill Repeats")
      expect(page).to have_content("06/01/2017")
      expect(page).to have_content(40)
      expect(page).to have_content(@exercise.name)
      expect(page).to have_content("I am tired now.")
    end

    it "adds a new exercise on create a new workout" do
      expect {
        fill_in "title", with: "100s"
        fill_in "date", with: "06/01/2017"
        fill_in "duration", with: 40
        fill_in "exercise", with: "Swimming"
        fill_in "note", "I swam at the gym."
        click_on "Create"
      }.to change(Exercise, :count).by(1)
    end
  end
end
