class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :ammount
      t.text :shipping_address
      t.integer :order_address
      t.string :order_mail
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
