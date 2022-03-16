class OrdersController < ApplicationController

    # YR 16.03.2022 - ActionMailer callback after "Order" creation to send the User an email with its kitten picture 
    after_create :order_send

    def order_send
      UserMailer.order_email(self).deliver_now
    end
    
end
