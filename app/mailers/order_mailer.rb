class OrderMailer < ApplicationMailer
	default from: 'no-reply@kittycat.fr'
	
	 def order_email(user)
  	@user=user
  	mail(to: @user.email, subject: "Your order at KittyCat!")
  end
end
