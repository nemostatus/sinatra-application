class User < ActiveRecord::Base 

  validates_uniqueness_of :username, :message => "username taken"
  has_secure_password
end 