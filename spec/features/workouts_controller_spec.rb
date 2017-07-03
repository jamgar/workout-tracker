require 'spec_helper'

describe "Workouts" do
  it "does not let a user view the workouts index if not logged in" do
    get '/workouts'
    expect(last_response.location).to include("/login")
  end

  it "does not let a user create a workout if not logged in" do
    get '/workouts/new'
    expect(last_response.location).to include("/login")
  end

  it "does not let a user view edit form if not logged in" do
    get "/workouts/1/edit"
    expect(last_response.location).to include('/login')
  end
end

describe "Workout Forms" do
  describe "/workouts/new" do
    before do
      @user = User.create(username: "testuser", email: "testuser@example.com", password: "test")
      @exercise = Exercise.create(name: "Running")
      visit '/login'
      fill_in "username", with: @user.username
      fill_in "password", with: @user.password
      click_on "Submit"

    end

    it "creates a new workout on submit" do
      visit '/workouts/new'
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
      visit '/workouts/new'
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
      @user = User.create(username: "testuser", email: "testuser@example.com", password: "test")
      exercise1 = Exercise.create(name: "Swimming")
      exercise2 = Exercise.create(name: "Running")
      @workout = Workout.create(title: "Pool Swim", date: "06/01/2017", duration: 50, note: "Swam 100m X 10 at gym pool", user_id: @user.id)

      @workout.workout_exercises.create(exercise: exercise1)
      @workout.save

      visit '/login'
      fill_in "username", with: @user.username
      fill_in "password", with: @user.password
      click_on "Submit"

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

<<<<<<< HEAD
      expect(page).to have_content("Successfully updated workout")
=======
      expect(page).to have_content("Successfully updated workout.")
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
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

    it "does not let a user edit another users workout" do
      user2 = User.create(username: "testuser2", email: "testuser2@example.com", password: "test")
      workout2 = Workout.create(title: "Cycling", date: "06/03/2017", duration: 90, note: "Rode at the park", user_id: user2.id)
      session = {}
      session[:user_id] = @user.id
      visit "/workouts/#{user2.id}/edit"
      expect(page.current_path).to include('/workouts')
    end

  end

end


<<<<<<< HEAD

=======
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
