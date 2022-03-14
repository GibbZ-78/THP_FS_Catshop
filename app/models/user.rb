class User < ApplicationRecord
  has_one :cart, dependent: :destroy
	has_many :orders, dependent: :destroy
end
