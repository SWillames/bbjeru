class Sale < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :client

  def self.total
    self.products.sum(&:price)
  end
end
