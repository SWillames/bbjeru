class Product < ActiveRecord::Base
	validates_presence_of :name, :mark, :price
	has_many :sales
  has_many :clents, through :sales
end
