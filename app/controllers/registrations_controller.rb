class RegistrationsController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'/signup/new'
    else
      redirect to '/workouts'  
    end
  end
  
end