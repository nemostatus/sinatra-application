class ProjectController < ApplicationController 
  
  get '/projects/new' do
    erb :'/projects/new'
  end
  
  post '/projects' do 
   @project = Project.create(comfort: params[:comfort],
   passion: params[:passion],
   deadline: params[:deadline],
   rating: params[:rating]
   )
  binding.pry
  end 

end