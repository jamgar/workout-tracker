class WorkoutsController < ApplicationController
  get '/workouts' do
    if logged_in?
      @workouts = Workout.where(user_id: session[:user_id])
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
end