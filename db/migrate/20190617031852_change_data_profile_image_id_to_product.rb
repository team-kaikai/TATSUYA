class ChangeDataProfileImageIdToProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :profile_image_id, :text
  end
end
