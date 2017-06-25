require 'config/environment'

class ApplicationController < Sinatra::Base
  config do
    set :public_folder, 'public'
    set :view, 'app/views'
    enable :sessions
    set :session_secret, "workout_secret"
  end
  
end
