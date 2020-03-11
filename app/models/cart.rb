class Cart < ApplicationRecord
	belongs_to :customer, class_name: "User", foreign_key: "customer_id"
	has_many :join_table_cart_items#JoinTableCartsItems
	has_many :items, through: :join_table_cart_items#JoinTableCartItems

end
