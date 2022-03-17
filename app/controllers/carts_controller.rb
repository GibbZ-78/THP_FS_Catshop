class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = Cart.find_by(user_id:current_user.id)
    if @cart.nil?
      @cart = Cart.create(user_id:current_user.id, comment: "Cart created")
      @items = @cart.items  # price    
    else
      @cart_items = CartItem.where(cart_id:@cart.id) # quantity  
      @items = @cart.items
    end
  end

  # def show
  # end

  # def new
  # end

  def update
  # JBV 16.03.2022 - Instantiated the "update" method of the current_user's cart when adding an item directly from a czrd of the 'items/index'
  # NB: if NO cart exists already for the current user (e.g. very first connexion) then create one
    if user_signed_in?
      @cart = Cart.find_by(user_id:current_user.id)   # At this stage, the user could have a cart already (or NOT!)
      if @cart.nil?                                   # If the user has a cart already, @cart points to it.
        @cart = Cart.create(user_id:current_user.id, comment: "Cart created to enable adding a new item")
      end
      
      @cart_item = CartItem.find_by(cart_id:@cart.id, item_id:params[:id])
      if @cart_item.nil?
        @cart_item = CartItem.create(cart_id:@cart.id, item_id:params[:id], quantity:1, comment:"Added from 'add to cart' button")
      else      
        @cart_item.update(quantity: (@cart_item.quantity+1), comment:"Added 1 to quantity")
      end
    
    else
      redirect_to user_new_session_path     # If user NOT signed-in but, for whatever reason, lands here (not possible theoretically), then redirect to web home page
    end
  end

  def destroy
    # Supprime le contenu de l'objet cart - 1..N items_cart
    @item = CartItem.find_by(item_id: params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to carts_path }
      format.js { }
    end
  end

end
