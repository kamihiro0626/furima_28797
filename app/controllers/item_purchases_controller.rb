class ItemPurchasesController < ApplicationController
   before_action :move_to_index
  def show
    @item_purchase = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  # def create
  # end
end
