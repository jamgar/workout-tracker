class WorkoutsController < ApplicationController
  
  get '/workouts' do
    erb :'/workouts/index'
  end

  get '/workouts/new' do
    erb :'/workouts/new'
  end
end
