class Order < ApplicationRecord
  belongs_to :user
	has_many :order_items, dependent: :destroy
	has_many :items, through: :order_items

  # YR 16.03.2022 - ActionMailer callback after "Order" creation to send the User an email with its kitten picture 
  after_create :order_send

  def order_send
    UserMailer.order_email(self).deliver_now
  end

end
