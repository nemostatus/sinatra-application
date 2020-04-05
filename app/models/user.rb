class User < ActiveRecord::Base 
validates :username, :password, presence: true

  has_many :projects
  has_secure_password
end 