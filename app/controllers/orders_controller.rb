class OrdersController < ApplicationController
	def index
		@oders = Order.find(params[:user_id])
	end
end
