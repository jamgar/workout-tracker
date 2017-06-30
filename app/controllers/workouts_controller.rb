class WorkoutsController < ApplicationController
  
  get '/workouts' do
    if logged_in?
      @workouts = Workout.find_by(user_id: session[:user_id])
      erb :'/workouts/index'
    else
      redirect to '/login'
    end
  end

  get '/workouts/new' do
    if logged_in?
      erb :'/workouts/new'
    else
      redirect to '/login'
    end
  end

  get '/workouts/:id' do
    @workout = Workout.find_by(id: params[:id])
    erb :'/workouts/show'
  end

  get '/workouts/:id/edit' do
    if logged_in?
      @workout = Workout.find_by(id: params[:id])
      erb :'/workouts/edit'
    else
      redirect to '/login'
    end
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
    @workout.update(params)
    if !params[:exercise].empty?
      @workout.exercises << Exercise.create(name: params[:exercise])
    end
    @workout.save

    flash[:message] = "Successfully updated workout"

    redirect to "/workouts/#{@workout.id}"
  end
end
