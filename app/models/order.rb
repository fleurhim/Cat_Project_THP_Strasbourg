class Order < ApplicationRecord
	after_create :order_send
  belongs_to :cart
  belongs_to :user

def order_send
    OrderMailer.order_email(self).deliver_now
  end

end
