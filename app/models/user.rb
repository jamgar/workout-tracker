class User < ActiveRecord::Base
  has_secure_password
  has_many :workouts
  validates_presence_of :username, :email
end
