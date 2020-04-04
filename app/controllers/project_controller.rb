
require './config/environment'
class ProjectController < ApplicationController 
  get '/projects/new' do
    erb :'/projects/new'
  end
  
  post '/projects' do 
    
   @project = Project.create(name: params[:name],
     comfort: params[:comfort],
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
  
  get '/projects' do 
     @projects = Project.all
     erb :'/projects/index'
  end 
  
  get '/projects/:id/edit' do 
    @project = Project.find(params[:id])
    erb :'/projects/edit'
  end
  
  post '/projects/:id' do
    @project = Project.find(params[:id])
    @project.update(name: params[:name],
     comfort: params[:comfort],
   passion: params[:passion],
   deadline: params[:deadline],
   rating: params[:rating]= params[:comfort].to_i+params[:passion].to_i+params[:deadline].to_i
   )
   redirect "/projects/#{@project.id}"
 end
 
  delete '/projects/:id' do 
    @project = Project.find(params[:id])
   @project.delete
    redirect to '/projects'
    end
end