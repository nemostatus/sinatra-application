  
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
    @session = session 
    @session[:user_id] = @user.id

   redirect "/users/#{@user.id}"
 end 
 end 
 
 get '/users/login' do 
  erb :'/users/login'
 end
 
 post '/users/login' do 
   @user = User.find_by(username: params[:username], password: params[:password])
    if  @user && params[:password] == @user.password
        @session = session
    @session[:user_id] = @user.id
    redirect '/users/:id' 
    else 
    redirect '/users/login'
 end 
 end
 
  get '/users/:id' do
    @user = User.find(session[:user_id])
    erb :'/users/show'
  end  
  
  get '/users/logout' do 
   @session.clear
   redirect '/users/login'
  end 
  
end