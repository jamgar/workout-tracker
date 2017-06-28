class Exercise < ActiveRecord::Base
  has_many :workout_exercise
  has_many :workouts, through: :workout_exercises
end
