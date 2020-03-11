class ApplicationController < ActionController::Base
	before_action :configure_devise_parameters, if: :devise_controller?
	before_action :set_cart

	def configure_devise_parameters
	  devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
	  devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :address, :current_password, :email, :password, :password_confirmation)}
	end

 
	private
	
	def set_cart
		@cart=Cart.find_by(customer_id: "23")
		rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart.id
	end
end
