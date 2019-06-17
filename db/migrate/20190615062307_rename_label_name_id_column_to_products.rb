class RenameLabelNameIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :label_name_id, :label_id
  end
end
