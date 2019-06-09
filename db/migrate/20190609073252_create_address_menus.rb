class CreateAddressMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :address_menus do |t|
      t.text :address
      t.string :postal_code
      t.integer :enduser_id
      t.string :name

      t.timestamps
    end
  end
end
