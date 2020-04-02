class ProjectController < ApplicationController 
  
  get '/projects/new' do
    erb :'/projects/new'
  end
  
  post '/projects' do 
    "process our form"
  
  end 

end