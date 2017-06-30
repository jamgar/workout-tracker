class WorkoutsController < ApplicationController
  get '/workouts' do
    if logged_in?
      erb :'/workouts/index'
    else
      redirect to '/login'
    end
  end
end