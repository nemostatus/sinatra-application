class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name 
      t.integer :comfort 
      t.integer :passion
      t.integer :deadline
      t.integer :rating
      t.integer :user_id 

  end
  end
end 
