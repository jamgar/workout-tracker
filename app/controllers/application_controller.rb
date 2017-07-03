require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "workout_secret"
    use Rack::Flash
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end
<<<<<<< HEAD

=======
    
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
