class OrdersController < ApplicationController

	def index
		@orders = params[:user_id].orders
	end

	def new
	end

	def create
	  @amount = @cart.amount_to_be_paid*100 # amount in cents
	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })
	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount.to_i,
	    description: 'Rails Stripe customer',
	    currency: 'eur',
		})
    @order = Order.new(
			user_id: @cart.customer_id,
			cart_id: @cart.id,
			delivery_address: "test adresse",
			items_number: @cart.items.length,
			total_order: @amount/100
		)
		if @order.save
			@cart.destroy
			#redirect_to user_path(current_user.id)
		else
		 render :back
		end

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_charge_path
	end
	
end
