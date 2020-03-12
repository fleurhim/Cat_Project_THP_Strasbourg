class Cart < ApplicationRecord
	has_many :orders
	has_many :users, through: :orders
	
	belongs_to :customer, class_name: "User", foreign_key: "customer_id"
	
	has_many :join_table_cart_items#JoinTableCartsItems
	has_many :items, through: :join_table_cart_items#JoinTableCartItems

	def amount_to_be_paid
		self.items.sum(&:price)
	end

end
