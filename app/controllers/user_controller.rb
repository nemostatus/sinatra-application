require './app/controllers/project_controller.rb'
class UserController < ApplicationController
  get '/users/signup' do
    erb :"/users/signup"
  end
  
  post '/users/signup' do #need middleware for delete action #need to check in tux what my db looks like
    @user = User.create(email: params[:email], 
    username: params[:username], 
    password: params[:password]
    )
   
    redirect "/users/#{@user.id}"
 end 
 
  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
   
end
end 