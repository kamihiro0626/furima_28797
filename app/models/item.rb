class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_day
  belongs_to :user, optional: true
  has_one_attached :image
  has_one :item_purchase, dependent: :destroy

  validate :image_presence

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'cannot be blank')
    end
  end

  with_options presence: true do
    validates :name
    validates :content
    validates :category_id
    validates :status_id
    validates :shipping_fee_burden_id
    validates :shipping_origin_id
    validates :shipping_day_id
    validates :price, format: { with: /\d/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
    validates :user_id
  end

 with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :shipping_fee_burden_id
  validates :shipping_origin_id 
  validates :shipping_day_id
 end
end
