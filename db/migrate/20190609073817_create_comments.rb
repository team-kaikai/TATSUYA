class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :enduser_id
      t.integer :product_id
      t.text :comment

      t.timestamps
    end
  end
end
