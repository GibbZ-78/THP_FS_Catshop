class OrderItem < ApplicationRecord
  belongs_to :order
	belongs_to :item

	validates :order, presence: true, uniqueness: true
	validates :item, presence: true, uniqueness: true
end
