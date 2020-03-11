class Cart < ApplicationRecord
	belongs_to :customer, class_name: "User"
	has_many :join_table_cart_items#JoinTableCartsItems
	has_many :items, through: :join_table_cart_items#JoinTableCartItems

	def amount_to_be_paid(cart)
		amount = cart.items.sum(&:price)
		return amount
	end

end
