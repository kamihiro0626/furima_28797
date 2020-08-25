class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_day
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :content
    validates :category_id
    validates :status_id
    validates :shipping_fee_burden_id
    validates :shipping_origin_id
    validates :shipping_days_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
    validates :user
  end

 with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :shipping_fee_burden_id
  validates :shipping_origin_id 
  validates :shipping_days_id
 end
end
