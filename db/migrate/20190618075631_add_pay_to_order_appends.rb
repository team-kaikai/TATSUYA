class AddPayToOrderAppends < ActiveRecord::Migration[5.2]
  def change
    add_column :order_appends, :pay, :integer
  end
end
