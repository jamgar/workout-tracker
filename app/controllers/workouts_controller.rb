class WorkoutsController < ApplicationController
<<<<<<< HEAD
  
=======
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
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

  get '/workouts/:id' do
<<<<<<< HEAD
    @workout = Workout.find_by(id: params[:id])
    erb :'/workouts/show'
=======
    if logged_in?
      @workout = Workout.find_by(id: params[:id])
      erb :'/workouts/show'
    else
      redirect to '/login'
    end
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
  end

  get '/workouts/:id/edit' do
    if logged_in?
      @workout = Workout.find_by(id: params[:id])
      erb :'/workouts/edit'
    else
      redirect to '/login'
    end
  end

  post '/workouts' do
    @workout = Workout.create(title: params[:title], date: params[:date], duration: params[:duration], note: params[:note], user_id: session[:user_id])
    @workout.exercise_ids = params[:exercises]
    if !params[:exercise].empty?
      @workout.exercises << Exercise.create(name: params[:exercise])
    end
    @workout.save

    flash[:message] = "Workout was successfully created."
<<<<<<< HEAD

    redirect to "/workouts/#{@workout.id}"
  end
  
  patch '/workouts/:id' do
    @workout = Workout.find_by(id: params[:id])
    @workout.update(params)
=======
    redirect to "/workouts/#{@workout.id}"
  end

  patch '/workouts/:id' do
    @workout = Workout.find_by(id: params[:id])
    @workout.update(title: params[:title], date: params[:date], duration: params[:duration], note: params[:note])
    @workout.exercise_ids = params[:exercises]
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
    if !params[:exercise].empty?
      @workout.exercises << Exercise.create(name: params[:exercise])
    end
    @workout.save

<<<<<<< HEAD
    flash[:message] = "Successfully updated workout"

    redirect to "/workouts/#{@workout.id}"
  end
end
=======
    flash[:message] = "Successfully updated workout."
    redirect to "/workouts/#{@workout.id}"    
  end
end
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
