class CartsController < ApplicationController
  
  # UPDATE
  # JBV 16.03.2022 - Instantiated the "update" method of the current_user's cart when adding an item directly from a czrd of the 'items/index'
  #                  Question: What if NO cart exists already (e.g. very first connexion) ? Do we have to test cart existence here
  #                            then create one if none exists or should it be done somewhere else (as soon as a user get connected) ?
  def update
    puts "DEBUG - Entering carts#update"
    if user_signed_in?
      puts "  > User is logged in as #{current_user.first_name} #{current_user.last_name} (#{current_user.id})."
      print "  > Selecting cart from current user"
      @cart = Cart.where(user_id:current_user.id)   #This is where @cart could be "nil"... How to manage it (cf. above)
      puts "...Found !"
      print "  > Inserting item (#{params[:cat_id]}) into cart (#{@cart.id})"
      @cart_item = CartItems.create(cart_id:@cart.id, item_id:params[:cat_id], comment:"Added from 'add to cart' button")
      puts "...Done"
    else
      puts "  > User is NOT logged. Redirecting to site home page."
      redirect_to root_path     # If user NOT signed in but for whatever reason lands here (not possible theoretically), then redirect to web home page
    end
  end

end
