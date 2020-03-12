class CartsController < ApplicationController 
    def show
      @cart=Cart.find_by(customer_id: current_user.id)
      @items=@cart.items
    end


    def create
    end
end
