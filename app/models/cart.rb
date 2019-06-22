class Cart < ApplicationRecord

	belongs_to :product
	belongs_to :end_user, class_name: "EndUser", foreign_key: "enduser_id"

	# validate :cart_quantity_limit

	# def add_product(product_id)
	# 	current_product = products.find_by_product_id(product_id)
	# 	if current_product
	# 		current_product.quantity += 1
	# 	else
	# 		current_product = products.build(product_id: product_id)
	# 	end
	# 	current_product
	# end

end


