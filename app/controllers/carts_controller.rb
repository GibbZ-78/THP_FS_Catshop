class CartsController < ApplicationController
  
  # UPDATE
  # JBV 16.03.2022 - Instantiated the "update" method of the current_user's cart when adding an item directly from a czrd of the 'items/index'
  #                  NB: if NO cart exists already for the current user (e.g. very first connexion) then create one
  def update
    puts "DEBUG - Entering carts#update"
    if user_signed_in?
      puts "  > User is logged in as #{current_user.first_name} #{current_user.last_name} (#{current_user.id})."
      print "  > Selecting cart from current user"
      @cart = Cart.find_by(user_id:current_user.id)   # At this stage, the user could have a cart already (or NOT!)
      if !@cart.nil?                                  # If the user has a cart already, @cart points to it.
        puts "...Found !"
      else
        @cart = Cart.create(user_id:current_user.id, comment: "Cart created to enable adding a new item")
        puts "...Needed to be created... Done !"
      end
      print "  > Inserting item (#{params[:cat_id]}) into cart (#{@cart.id}) of current user (#{current_user.id})"
      @cart_item = CartItem.create(cart_id:@cart.id, item_id:params[:cat_id], comment:"Added from 'add to cart' button")
      puts "...Done"
    else
      puts "  > User is NOT logged. Redirecting to site home page."
      redirect_to root_path     # If user NOT signed-in but, for whatever reason, lands here (not possible theoretically), then redirect to web home page
    end
  end

end
