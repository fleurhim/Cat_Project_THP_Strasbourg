class Cart < ApplicationRecord
	belongs_to :customer, class_name: "User"
	has_many :join_table_cart_items#JoinTableCartsItems
	has_many :items, through: :join_table_cart_items#JoinTableCartItems

end
