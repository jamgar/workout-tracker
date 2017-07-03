class SessionsController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
  get '/login' do
    if !logged_in?
      erb :'/session/index'
    else
      redirect to '/workouts'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

<<<<<<< HEAD
    if @user && @user.authenticate(params[:password])      
=======
    if @user && @user.authenticate(params[:password])
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
      session[:user_id] = @user.id
      redirect to '/workouts'
    else
      flash[:message] = "Incorrect username or password. Try again."
      redirect to '/login'
    end
  end
<<<<<<< HEAD

=======
  
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
