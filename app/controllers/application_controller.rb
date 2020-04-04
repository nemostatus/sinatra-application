

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, "supersecret"
  end

  get "/" do
    
    redirect '/users/signup'

  end 
  
end