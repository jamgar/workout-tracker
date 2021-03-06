class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  validates_presence_of :title, :date
end
