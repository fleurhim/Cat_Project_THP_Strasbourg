class ApplicationController < ActionController::Base
	before_action :configure_devise_parameters, if: :devise_controller?
	before_action :set_cart

	def configure_devise_parameters
	  devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
	  devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :address, :last_name, :address, :current_password, :email, :password, :password_confirmation)}
	end

	private

	def set_cart
		if current_user
			@cart = Cart.find_by(customer_id: current_user.id)
			if @cart.nil?
				@cart = Cart.create(customer_id: current_user.id)
			end
		end
	end

end
