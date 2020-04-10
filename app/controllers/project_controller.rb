class ProjectController < ApplicationController 
  get '/projects/new' do
   if logged_in?
    erb :'/projects/new'
   else
    redirect '/users/signup'
  end
  end
  
  post '/projects' do 
   
   @project = Project.new(name: params[:name],
   project_type: params[:project_type],
   comfort: params[:comfort],
   passion: params[:passion],
   deadline: params[:deadline],
   description: params[:description],
   rating: params[:rating]= params[:comfort].to_i+params[:passion].to_i+params[:deadline].to_i,
   user_id: session[:user_id], created_at: params[:created_at], updated_at: params[:updated_at]
   )

   @project.save
  
   redirect "/projects/#{@project.id}"
  end 
  
  get '/projects/:id' do 
    #match project user_id with current user_id
   @project = Project.find(params[:id])
    if @project.user_id == current_user.id
     erb :'/projects/show'
    else 
     erb :'/users/authentication'
  end 
  end
  
  get '/projects' do 
    @projects = Project.where(:user_id => session[:user_id]).order('rating DESC','project_type ASC')
    erb :'/projects/index'
  end 
  
  get '/projects/:id/edit' do 
    #make it unique to user by session[:user_id]
   @project = Project.find(params[:id])
    if @project.user_id == current_user.id
     erb :'/projects/edit'
    else 
     erb :'/users/authentication'
  end
  end
  
   
  patch '/projects/:id' do
    @project = Project.find(params[:id])
    if @project.user_id == current_user.id
    @project.update(name: params[:name],
     comfort: params[:comfort],
     passion: params[:passion],
     deadline: params[:deadline],
     description: params[:description],
     rating: params[:rating]= params[:comfort].to_i+params[:passion].to_i+params[:deadline].to_i
     )
    redirect "/projects/#{@project.id}"
 end
 end 
 
  delete '/projects/:id' do 
    @project = Project.find(params[:id])
    if @project.user_id == current_user.id
   @project.destroy
    redirect to '/projects'
  end
  end
    
  delete '/projects' do 
    @projects = Project.all.where(:user_id => session[:user_id])
   if logged_in?
    @projects.destroy_all
    redirect "/users/#{current_user.id}"
  end
  end
  
  get '/projects/' do 
    erb :'/projects/message'
  end
end