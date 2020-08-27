class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
    @items = Item.order("create_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :content, :category_id, :status_id, :shipping_fee_burden_id, :shipping_origin_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
