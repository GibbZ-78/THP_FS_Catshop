class ItemsController < ApplicationController

  # JBV 15.03.2022 - Created 'index' method to be able to complete the routing to and feed of the "All products" page
  def index
    @items = Item.all
  end

end
