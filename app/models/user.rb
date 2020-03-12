class User < ApplicationRecord
  after_create :welcome_send
  
  has_many :orders
  has_many :carts, through: :orders

	has_many :items, class_name: "Item", foreign_key: "admin_id"
  has_many :customers, class_name: "Cart", foreign_key: "cart_id"

  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
end
