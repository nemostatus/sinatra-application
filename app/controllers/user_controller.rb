
class UserController < ApplicationController
  get '/users/signup' do
      if logged_in? 
         redirect "/users/#{current_user.id}"
      else
    erb :"/users/signup"
  end
  end
  
  post '/users/signup' do #need middleware for delete action #need to check in tux what my db looks like
    if params[:username] = "" && params[:password] == ""
      redirect "/users/signup"
  else
  @user = User.create(email: params[:email], 
       username: params[:username], 
      password: params[:password]
       )
    
    redirect "/users/#{@user.id}"
 end   
 end 
 
  get '/users/login' do
     if logged_in?   
         redirect "/users/#{current_user.id}"  
      else
         erb :'/users/login'
      end
    end
 
  
  post '/users/login' do 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else 
      redirect "/users/login"
  end 
  end
  
  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end
  
  get '/logout' do 
    session.clear 
    redirect '/users/login'
  end 
end