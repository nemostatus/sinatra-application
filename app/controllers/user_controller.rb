  
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
 @user = User.find(params[:id])
    erb :'/users/show'
  end  
  
  get '/logout' do 
   session.clear
   redirect '/login'
  end 
  
end