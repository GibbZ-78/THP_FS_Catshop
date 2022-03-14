class Item < ApplicationRecord
  has_many :order_items #A REVOIR, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	has_many :orders, through: :order_items
	has_many :carts, through: :cart_items
end
