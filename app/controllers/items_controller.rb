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
    params.require(:item).permit(:name, :image, :content, :category, :status, :shipping_fee_burden_id, :shipping_origin_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
