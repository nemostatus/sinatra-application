  
class UserController < ApplicationController
  get '/users/signup' do
    erb :"/users/signup"
  end

  post '/users/signup' do 
   if params[:username] == "" || params[:password] == ""
    
     redirect '/users/signup' 
   else
    @user = User.new(email: params[:email], 
    username: params[:username], 
    password: params[:password]
    )
    @user.save
 
    session[:user_id] = @user.id
   

   redirect "/users/#{@user.id}"
 end 
 end 
 
 get '/login' do 
  erb :'/users/login'
 end
 
 post '/login' do 
   
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id 
         redirect "/users/#{@user.id}"
      else  
         redirect "/login"
      end 

     end
 
  get '/users/:id' do
    #conditionial needed to view the endpoint
   @user = User.find(params[:id]) #maybe before doing this action authenticate the session so that 1 user can't simply edit the endpoint 
   erb :'/users/show'


  end

  
  get '/logout' do 
   session.clear
   redirect '/login'
  end 
  
  get '/users/' do 
    erb :'/users/message'
  end 
  
end