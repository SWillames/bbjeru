class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :value
      t.references :client, index: true, foreign_key: true
      t.string :installments
      t.string :description

      t.timestamps null: false
    end

    create_table :products do |t|
      t.float :price
      t.text :description
      t.string :mark
      t.string :name

      t.timestamps null: false
    end

    create_table :products_sales, id: false do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :sale, index: true, foreign_key: true
    end
  end
end
