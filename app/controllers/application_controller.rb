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

	protected
		def configure_permitted_parameters
	 		devise_parameter_sanitizer.permit(:sign_up,keys:[:first_name,:last_name,:details_first_name,:details_last_name,:postal_code,:address,:tel])
	 	end

	private
	def current_cart

		Cart.find(session[:cart_id])

		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
	end

end
