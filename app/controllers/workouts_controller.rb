class WorkoutsController < ApplicationController
  
  get '/workouts' do
    erb :'/workouts/index'
  end

  get '/workouts/new' do
    erb :'/workouts/new'
  end

  post '/workouts' do
    @workout = Workout.create(title: params[:title], date: params[:date], duration: params[:duration], note: params[:note])
    @workout.exercise_ids = param[:exercises]
    @workout.save

    flash[:message] = "Workout was successfully created."

    redirect to '/workouts/#{@workout.id}'
  end

  get '/workouts/:id' do
    @workout = Workout.find_by(id: params[:id])
    erb :'/workouts/show'
  end
end
