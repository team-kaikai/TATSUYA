class CreateOrderAppends < ActiveRecord::Migration[5.2]
  def change
    create_table :order_appends do |t|
      t.text :address
      t.integer :enduser_id
      t.string :name
      t.string :postal_code
      t.integer :subtotal
      t.integer :status

      t.timestamps
    end
  end
end
