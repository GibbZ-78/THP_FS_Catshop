class CartsController < ApplicationController
  
  # JBV 16.03.2022 - Instantiated the "update" method of the current_user's cart when adding an item directly from a czrd of the 'items/index'
  def update
    if user_signed_in?
      @cart = Cart.where(user_id:current_user.id)
      @cart_item = CartItems.new()
    else
      redirect_to root_path
    end
  end

end
