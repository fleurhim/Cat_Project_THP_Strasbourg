class Cart < ApplicationRecord
	belongs_to :customer, class_name: "User"
	has_many :join_table_carts_items#JoinTableCartsItems
	has_many :items, through: :join_table_carts_items#JoinTableCartItems
end
