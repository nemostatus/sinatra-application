class ProjectController < ApplicationController 
  
  get '/projects/new' do
    erb :'/projects/new'
  end
  
  post '/projects' do 
   @project = Project.create(comfort: params[:comfort],
   passion: params[:passion],
   deadline: params[:deadline],
   rating: params[:rating]= params[:comfort].to_i+params[:passion].to_i+params[:deadline].to_i
   )
 redirect "/projects/#{@project.id}"
  end 
  
  get '/projects/:id' do 
    @project = Project.find(params[:id])
    erb :'/projects/show'
  end 
    
    
  end