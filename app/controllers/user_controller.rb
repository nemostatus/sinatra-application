require './app/controllers/project_controller.rb'
class UserController < ApplicationController
  get '/users/signup' do
    erb :"/users/signup"
  end
  
  post '/users/signup' do #need middleware for delete action #need to check in tux what my db looks like
    if params[:username] = "" || params[:password] == ""
      redirect "/users/signup"
    else 
       @user = User.create(email: params[:email], 
       username: params[:username], 
      password: params[:password]
       )
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
 end   
 end 
 
  get '/users/login' do
  erb :'/users/login'
  
  end 
  
  post '/users/login' do 
    @user = User.find_by(username: params[:username])
  end 
  
  get '/users/:id' do
    @user = User.find_by(params[:id])
    erb :'/users/show'
   
end
end 