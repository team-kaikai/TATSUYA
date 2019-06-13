class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters,if: :devise_controller?

	def after_sign_in_path_for(resource)
		products_path
	end

	protected
		def configure_permitted_parameters
	 			devise_parameter_sanitizer.permit(:sign_up,keys:[:first_name,:last_name,:details_first_name,:details_last_name,:postal_code,:address,:tel])
	 	end


end
