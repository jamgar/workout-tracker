class WorkoutsController < ApplicationController
  
  get '/workouts' do
    erb :'/workouts/index'
  end
end
