class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address, :building, :telephone

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\d{3}-\d{4}/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :telephone, length: { maximum: 11 }, format: { with: /\d{0,9}/ }
  end 

  def save
    ItemPurchase.create(user_id: user_id, item_id: item_id)
    ShippingAddresse.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone)
  end
end