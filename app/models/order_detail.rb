class OrderDetail < ApplicationRecord
	belongs_to :products
	belongs_to :order_append

end
