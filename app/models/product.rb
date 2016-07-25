class Product < ActiveRecord::Base
	validates_presence_of :name, :mark, :price
	has_and_belongs_to_many :sales
  #has_many :clients, through: :sales
end
