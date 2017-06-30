class SessionsController < ApplicationController
  get '/login' do
    if !logged_in?
      erb :'/session/index'
    else
      redirect to '/workouts'
    end
  end
  
end