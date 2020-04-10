class User < ActiveRecord::Base 
 validates_presence_of :username, :password, :email
  validates_uniqueness_of :username
  has_secure_password
end 