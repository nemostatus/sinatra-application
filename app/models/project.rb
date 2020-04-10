class Project < ActiveRecord::Base 
  validates_presence_of :name,:project_type, :comfort, :passion, :deadline, :description
belongs_to :user 
end 