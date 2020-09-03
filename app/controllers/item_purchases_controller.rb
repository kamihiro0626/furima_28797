class ItemPurchasesController < ApplicationController
   before_action :authenticate_user!
   before_action :user_restriction


  def show
    @item = Item.find(params[:item_id])
    @item_purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_purchase = PurchaseAddress.new(purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def user_restriction
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
       redirect_to root_path 
    end
  end

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
