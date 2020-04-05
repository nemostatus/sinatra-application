  
class UserController < ApplicationController
  get '/users/signup' do
    erb :"/users/signup"
  end
  
  
  post '/users/signup' do 
  
    @user = User.new(email: params[:email], 
    username: params[:username], 
    password: params[:password]
    )
    @user.save
   redirect "/users/#{@user.id}"
 end 
 
 get '/users/login' do 
  erb :'/users/login'
 end
 
 post '/users/login' do 
   @user = User.find_by(username: params[:username])
   
 end 
 
  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end  
end