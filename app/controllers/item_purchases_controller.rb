class ItemPurchasesController < ApplicationController
   before_action :move_to_sessions_index
  #  before_action :move_to_index


  def show
    @item = Item.find(params[:item_id])
    @item_purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_purchase = PurchaseAddress.new(purchase_params)
    # binding.pry
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def move_to_sessions_index
    unless user_signed_in? 
      redirect_to new_user_session_path
    end
  end

  # def move_to_index
  #   if current_user.id == @item.user.id
  #     redirect_to root_path
  #   end
  # end

  def purchase_params
    params.permit(
      :postal_code, 
      :prefecture_id, 
      :city, 
      :address, 
      :building, 
      :telephone,
      :token
    ).merge(user_id: current_user.id).merge(params.permit(:item_id))
  end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
   Payjp::Charge.create(
     amount: @item.price,            # 商品の値段
     card: purchase_params[:token],    # カードトークン
     currency:'jpy'                 # 通貨の種類(日本円)
   )
 end
  
end
