class CartsController < ApplicationController 
    def show
      @cart=Cart.find_by(customer_id: "71")
      @items=@cart.items
    end


    def create
    end
end
