class StaticPagesController < ApplicationController
  def home
      @items = Item.all
      @item = @items[0]
  end

  def about
  end

  def contact
  end
end
