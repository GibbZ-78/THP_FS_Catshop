class Item < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :carts, through: :cart_items

	has_many :order_items, dependent: :destroy #A voir si on le conserve
	has_many :orders, through: :order_items

	
	def itemSubTotal(quantity)
  	self.price * quantity
 	end
	 
end
