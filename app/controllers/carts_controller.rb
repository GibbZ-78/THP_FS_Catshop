class CartsController < ApplicationController
  # before_action :authenticate_user!
  
  def index
    
  end

  def show
    # Le show du cart doit renvoyer les cart_items
  end

  def new
    # Instancie l'objet cart
  end

  def update
    # Met à jour le contenu de l'objet cart - cf. les cart items et le montant total
  end

  def destroy
    # Supprime le contenu de l'objet cart - 1..N items_cart
  end
end
