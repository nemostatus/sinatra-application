class UserController < ApplicationController
  get '/users/signup' do
    erb :"/users/signup"
  end
  
  post '/users/signup' do 
 @user = User.create(email: params[:email], 
 username: params[:username], 
 password: params[:password]
 )
  end 
end 