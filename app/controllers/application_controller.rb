class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters,if: :devise_controller?

	# def after_sign_in_path_for(resource)
	# 	products_path
	# end

	def after_sign_in_path_for(resource)
 		 case resource
 		 	when Admin
    			admins_end_users_path
  			when EndUser
    			products_path
 		 end
	end

	# helper_method :get_subtotal

	# def get_subtotal(c)
	# 	total = 0

	# 		subtotal= c.product.price * c.quantity
	# 		total += subtotal
	# 		return total
	# end



# def subtotal


# def sumprice
# 	sum(:price)
# end


# パターン1 破綻
	# def info(subtotal)
	#  	subtotal = 0
	#  	self.subprice = cart.product.
	#  	subtotal= price * quantity
	#  	return subtotal
	#  end

	# def gettotal(total_price)
	# 	self.total_price = self.subtotal.sum * 1.08 + 500
	# end

# パターン2 破綻
	# def add_subtotal(price:,quantity:)
	# 	self.subtotal = 0
	# 		self.subtotal = Cart.product.p * Cart.product.quantity
	#  		return subtotal
	# end

	# def total_price(c)
	# 	self.total = 0
	# 		self.total = self.subtotal * 1.08 + 500
	# 		return total
	# end
	helper_method :info





	protected
		def configure_permitted_parameters
	 		devise_parameter_sanitizer.permit(:sign_up,keys:[:first_name,:last_name,:details_first_name,:details_last_name,:postal_code,:address,:tel])
	 	end


end
