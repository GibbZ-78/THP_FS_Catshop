class Cart < ApplicationRecord
  has_one :user
	has_many :cart_items, dependent: :destroy
	has_many :items, through: :cart_items

	validates :user, presence: true, uniqueness: true
end
