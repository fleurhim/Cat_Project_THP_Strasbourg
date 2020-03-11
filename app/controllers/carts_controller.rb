class CartsController < ApplicationController 
    def show
      @cart=Cart.find_by(customer_id: "10")
      @items=@cart.items
    end
end
