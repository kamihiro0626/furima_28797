class ShippingAddresse < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code, format: { with: /\d{3}-\d{4}/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :telephone, format: { with: /\d{11}/ }
  end 
end
