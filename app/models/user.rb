class User < ActiveRecord::Base
  #validates_presence_of :username, :password
  has_many :records
end
