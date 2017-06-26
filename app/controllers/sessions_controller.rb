class SessionsController < ApplicationController

  get '/login' do
    erb :'/session/index'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])      
      session[:user_id] = @user.id
      binding.pry
      redirect to '/workouts'
    else
      flash[:message] = ""
      redirect to '/login'
    end
  end
end
