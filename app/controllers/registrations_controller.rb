class RegistrationsController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/signup/new'
    else
      redirect to '/workouts'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/workouts'
    else
      flash[:message] = "All fields are required."
      redirect to '/signup'
    end
  end
end
