class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  validates_presence_of :title, :date
end
<<<<<<< HEAD

=======
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
