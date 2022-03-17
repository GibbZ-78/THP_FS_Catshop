class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = Cart.find_by(user_id:current_user.id)
    if @cart.nil?
      @cart = Cart.create(user_id:current_user.id, comment: "Cart created when user displays cart 'show' page")
      @items = @cart.items  # Dans ce cas, @items est "nil" >> pris en charge dans la vue
    else
      @cart_items = CartItem.where(cart_id:@cart.id) # @cart_items contient les lignes du panier (incl. "quantity")
      @items = @cart.items  # @items contient chaque item liés à une des lignes du panier (incl. "price")
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
        @cart = Cart.create(user_id:current_user.id, comment: "Cart created via the 'update' method when user adding a new item")
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
  end

end
