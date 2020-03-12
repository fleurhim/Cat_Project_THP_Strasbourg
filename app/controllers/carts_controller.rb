class CartsController < ApplicationController 
	before_action :is_the_owner_of_the_page?, only: [:show, :destroy]

    def show
      @cart=Cart.find_by(customer_id: current_user.id)
      @items=@cart.items
    end


    def create
    end

    def destroy
    	@cart = Cart.find_by(customer_id: current_user.id)
    	@cart.destroy
    	redirect_to cart_path(customer_id: current_user.id)
    end

    private

  	def is_the_owner_of_the_page?
  		unless current_user.id.to_i == @cart.customer_id.to_i
  		redirect_to items_path
  		end
  	end
end
