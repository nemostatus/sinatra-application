

class ProjectController < ApplicationController 
  get '/projects/new' do
    erb :'/projects/new'
  end
  
  post '/projects' do 
   
   @project = Project.new(name: params[:name],
     comfort: params[:comfort],
   passion: params[:passion],
   deadline: params[:deadline],
   description: params[:description],
   rating: params[:rating]= params[:comfort].to_i+params[:passion].to_i+params[:deadline].to_i
  )
   
  @project.save
  
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
  
   
  patch '/projects/:id' do
    @project = Project.find(params[:id])
    @project.update(name: params[:name],
     comfort: params[:comfort],
   passion: params[:passion],
   deadline: params[:deadline],
   description: params[:description],
   rating: params[:rating]= params[:comfort].to_i+params[:passion].to_i+params[:deadline].to_i
   )
   redirect "/projects/#{@project.id}"
 end
 
  delete '/projects/:id' do 
    @project = Project.find(params[:id])
   @project.destroy
    redirect to '/projects'
    end
    
  delete '/projects' do 
    @projects = Project.all 
    @projects.destroy_all
    redirect '/projects/new'
  end
end