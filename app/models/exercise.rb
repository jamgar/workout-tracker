class Exercise < ActiveRecord::Base
<<<<<<< HEAD
  has_many :workout_exercise
  has_many :workouts, through: :workout_exercises
end
=======
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
end
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
