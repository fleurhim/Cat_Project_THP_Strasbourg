class CartsController < ApplicationController 
    def show
        @cart=Cart.find(params[:id])
        @jointable= JoinTableCartItem.where(cart_id: params[:id])
        @item = Item.where(id: @jointable)
    end
end
