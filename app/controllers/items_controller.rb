class ItemsController < ApplicationController
  def index
    @items = Item.order("create_at DESC")
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    elsea
      render :new
    end
  end

  private

  def item_params
    params.require(:item)
  end
end
