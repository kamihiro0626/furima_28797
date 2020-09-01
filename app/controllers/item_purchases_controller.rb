class ItemPurchasesController < ApplicationController
   before_action :move_to_index
   attr_accessor :token

  def show
    @item_purchase = Item.find(params[:id])
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def purchase_params
    params.require(:item_purchase).permit(:user_id, :item_id, :token)
  end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
   Payjp::Charge.create(
     amount: purchase_params[:item_id.price],  # 商品の値段
     card: purchase_params[:token],    # カードトークン
     currency:'jpy'                 # 通貨の種類(日本円)
   )
 end
  
end
