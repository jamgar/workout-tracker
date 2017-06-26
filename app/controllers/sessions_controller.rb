class SessionsController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'/session/index'
    else
      redirect to '/workouts'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])      
      session[:user_id] = @user.id
      redirect to '/workouts'
    else
      flash[:message] = ""
      redirect to '/login'
    end
  end
end
