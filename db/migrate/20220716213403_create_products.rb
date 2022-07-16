class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.integer :price
      t.string :weight
      t.text :description
      t.string :category
      t.integer :stock

      t.timestamps
    end
  end
end
