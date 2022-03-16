class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Le show du cart doit renvoyer les cart_items
    
  end

  # def show
  # end

  def new
    # Instancie l'objet cart

  end

  def update
  # JBV 16.03.2022 - Instantiated the "update" method of the current_user's cart when adding an item directly from a czrd of the 'items/index'
  # NB: if NO cart exists already for the current user (e.g. very first connexion) then create one
    if user_signed_in?
      @cart = Cart.find_by(user_id:current_user.id)   # At this stage, the user could have a cart already (or NOT!)
      if @cart.nil?                                  # If the user has a cart already, @cart points to it.
        @cart = Cart.create(user_id:current_user.id, comment: "Cart created to enable adding a new item")
      end
      @cart_item = CartItem.create(cart_id:@cart.id, item_id:params[:cat_id], comment:"Added from 'add to cart' button")
    else
      redirect_to user_new_session_path     # If user NOT signed-in but, for whatever reason, lands here (not possible theoretically), then redirect to web home page
    end
  end

  def destroy
    # Supprime le contenu de l'objet cart - 1..N items_cart

  end
end
