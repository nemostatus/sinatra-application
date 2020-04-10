class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, "1s2a3l4t"
  end

  get "/" do
   
     redirect '/users/signup'
  end

  
  helpers do 

    def logged_in? 
      !!session[:user_id]
    end 

    def current_user
      @current_user ||= User.find(session[:user_id])
    end 
    end 

end