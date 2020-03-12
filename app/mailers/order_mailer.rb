class OrderMailer < ApplicationMailer
	default from: 'no-reply@kittycat.fr'
	
	 def order_email(order)
  	@order=order
  	mail(to: User.find(@order.user_id).email, subject: "Your order at KittyCat!")
  end
end

