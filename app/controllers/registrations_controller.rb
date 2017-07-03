class RegistrationsController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
  get '/signup' do
    if !logged_in?
      erb :'/signup/new'
    else
<<<<<<< HEAD
      redirect to '/workouts'
=======
      redirect to '/workouts'  
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
    end
  end

  post '/signup' do
<<<<<<< HEAD
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
=======
    @user = User.new(params)
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
    if @user.save
      session[:user_id] = @user.id
      redirect to '/workouts'
    else
      flash[:message] = "All fields are required."
      redirect to '/signup'
    end
  end
<<<<<<< HEAD
end
=======
  
end
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
