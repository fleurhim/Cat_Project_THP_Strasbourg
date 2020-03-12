class JoinTableCartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @additem = JoinTableCartItem.new(cart_id: @cart.id, item_id: params[:item])
      
    if @additem.save
      flash[:success] = 'This item was added to your cart'
      redirect_to request.referrer ### REDIRECT TO SAME PAGE
    else
      flash[:error] = 'There was a problem adding this item to your cart'
      redirect_to request.referrer
    end
  end

  def destroy
    @item_to_destroy = JoinTableCartItem.find_by(cart_id: params[:cart_id], item_id: params[:id])
    @item_to_destroy.destroy
  end
end
