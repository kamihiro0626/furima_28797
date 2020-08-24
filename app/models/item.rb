class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_fee_burden, :shipping_origin, :shipping_days
  belongs_to :user


  with_options presence: true do
    validates :name, :image, :content, :category, :status, :shipping_fee_burden, :shipping_origin, :shipping_days, :price, :user
  end

 with_options numericality: { other_than: 1 } do
  validates :category, :status, :shipping_fee_burden, :shipping_origin, :shipping_days
 end
end
