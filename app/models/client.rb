class Client < ActiveRecord::Base
  validates_presence_of :name, :cpf, :location, :salary
  validates_length_of :cpf, is: 11
  validates_uniqueness_of :cpf
end
