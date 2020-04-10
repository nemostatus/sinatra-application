  
class UserController < ApplicationController
    get '/users/signup' do
       if logged_in? 
         redirect "/users/#{current_user.id}"
      else
         erb :'/users/signup'        
      end 
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
    if logged_in?   
         redirect "/users/#{current_user.id}"  
      else
  erb :'/users/login'
 end
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
   @user = User.find(params[:id])  
     if @user.id == current_user.id #im testing this line if user.id doesnt match current_users id then it will go to auth
     erb :'/users/show'
    else 
      erb :'/users/authentication'
  end
  end
  
  get '/logout' do 
   session.clear
   redirect '/login'
  end 
  
  get '/users/' do 
    erb :'/users/message'
  end 
  
end