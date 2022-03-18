class OrdersController < ApplicationController
    def create
      order = Order.new(
        'user_id' => current_user.id,
        'total' => @total
      )
    end
end
