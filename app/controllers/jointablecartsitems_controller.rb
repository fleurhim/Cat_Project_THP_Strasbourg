class JointablecartsitemsController < ApplicationController
    before_action :set_cart, only: [:create, :destroy]

    def index
        @jointablecartsitems = JoinTableCartItem.all
    end 

  def create
    @cart.add_item(params)
     
    if @cart.save
      redirect_to user_cart_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to @item
    end
  end

    def destroy
        @cart_item.destroy
        redirect_to cart_path
    end
end
