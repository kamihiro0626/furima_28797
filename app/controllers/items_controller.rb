class ItemsController < ApplicationController
  def index
    @items = Item.order("create_at DESC")
  end

  def new
    @item = Item.new
  end

end
