class WorkoutsController < ApplicationController
  
  get '/workouts' do
    erb :'/workouts/index'
  end

  get '/workouts/new' do
    erb :'/workouts/new'
  end

  get '/workouts/:id' do
    @workout = Workout.find_by(id: params[:id])
    erb :'/workouts/show'
  end

  get '/workouts/:id/edit' do
    @workout = Workout.find_by(id: params[:id])
    erb :'/workouts/edit'
  end

  post '/workouts' do
    @workout = Workout.create(title: params[:title], date: params[:date], duration: params[:duration], note: params[:note])
    @workout.exercise_ids = params[:exercises]
    if !params[:exercise].empty?
      @workout.exercises << Exercise.create(name: params[:exercise])
    end
    @workout.save

    flash[:message] = "Workout was successfully created."

    redirect to "/workouts/#{@workout.id}"
  end
  
  patch '/workouts/:id' do
    @workout = Workout.find_by(id: params[:id])
    #binding.pry
    @workout.update(params)
  end
end
