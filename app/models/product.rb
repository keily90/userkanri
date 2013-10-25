class Product < ActiveRecord::Base
  
  attr_accessible :name, :type ,:price ,:number
  
end
