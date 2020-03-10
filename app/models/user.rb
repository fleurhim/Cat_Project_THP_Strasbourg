class User < ApplicationRecord
	has_many :items, foreign_key: 'admin_id', class_name: "Item"
  has_one :cart, foreign_key: 'customer_id', class_name: "Cart"
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
