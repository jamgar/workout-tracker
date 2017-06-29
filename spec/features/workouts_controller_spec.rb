require 'spec_helper'

describe "Workout Forms" do
  describe "/workouts/new" do
    before do
      @exercise = Exercise.create(name: "Running")
      visit '/workouts/new'
    end

    it "creates a new workout on submit" do
      fill_in "title", with: "Hill Repeats"
      fill_in "date", with: "06/01/2017"
      fill_in "duration", with: 40
      check @exercise.name
      fill_in "note", with: "I am tired now."
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
        fill_in "note", with: "I swam at the gym."
        click_on "Create"
      }.to change(Exercise, :count).by(1)
    end
  end

  describe "/workouts/:id/edit" do
    before do
      exercise1 = Exercise.create(name: "Swimming")
      exercise2 = Exercise.create(name: "Running")
      @workout = Workout.create(title: "Pool Swim", date: "06/01/2017", duration: 50, note: "Swam 100m X 10 at gym pool")

      @workout.workout_exercises.create(exercise: exercise1)
      @workout.save

      visit "/workouts/#{@workout.id}/edit"
    end

    it "updates workout's title" do
      fill_in "title", with: "Laps at Pool"
      click_on "Update"

      expect(page).to have_content("Successfully updated workout")
      expect(page).to have_content("Laps at Pool")
      expect(page).to have_content("Swimming")
    end

    it "has a checkbox element on the form" do
      expect(page.body).to include("checkbox")
    end

    it "updates the exercises with existing exercise list" do
      uncheck "Swimming"
      check "Running"
      click_on "Update"

      expect(page).to have_content("Successfully updated workout")
      expect(page).to have_content("Pool Swim")
      expect(page).to have_content("Running")
    end

    it "creates and adds a new exercise to the workout" do
      fill_in "exercise", with: "Weightlifting"
      click_on "Update"

      expect(page).to have_content("Successfully updated workout")
      expect(page).to have_content("Swimming")
      expect(page).to have_content("Weightlifting")
    end
  end
end
