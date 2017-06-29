class AddDurationToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :duration, :integer
  end
end
