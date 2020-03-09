class Item < ApplicationRecord
	belongs_to :admin, class_name: "User"
	# has_many :carts
	# has_many :users, through: :carts 
	has_many :join_table_carts_items#JoinTableCartItems
	has_many :carts, through: :join_table_carts_items#JoinTableCartItems
	has_many :users, through: :carts

end

