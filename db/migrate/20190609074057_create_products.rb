class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.integer :label_name_id
      t.integer :profile_image_id
      t.integer :artist_id
      t.string :album_name
      t.integer :price
      t.integer :stock
      t.integer :status

      t.timestamps
    end
  end
end
