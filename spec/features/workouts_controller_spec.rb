require 'spec_helper'

describe "Workout Forms" do
  describe "/workouts/new" do
    before do
      visit '/workouts/new'
    end

    context "creates a new workout on submit" do
      fill_in "Title", with: "Hill Repteats"
      fill_in "Date", with: "06/01/2017"
      fill_in "Duration(min)", with: 40
      check "Running"
      fill_in "Note", "I am tired now."
      click_on "Create"

      expect(page).to have_content("Hill Repeats")
      expect(page).to have_content("06/01/2017")
      expect(page).to have_content(40)
      expect(page).to have_content("Running")
      expect(page).to have_content("I am tired now.")
    end
  end
end
