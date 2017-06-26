class WorkoutsController < ApplicationController
  
  get '/workouts' do
    binding.pry
    erb :'/workouts/index'
  end
end
