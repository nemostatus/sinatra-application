class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name 
      t.string :project_type
      t.integer :comfort 
      t.integer :passion
      t.integer :deadline
      t.string :description
      t.integer :rating
      t.integer :user_id 

  end
  end
end 
