class WorkoutsController < ApplicationController
  get '/workouts' do
    if logged_in?
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