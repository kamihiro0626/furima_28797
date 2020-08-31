class User < ApplicationRecord                       
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  
  with_options presence: true do
   validates :nickname
   validates :email
   validates :password, format: { with: VALID_PASSWORD_REGEX }
   validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }
   validates :family_name, format: { with: VALID_NAME_REGEX }
   validates :first_name, format: { with: VALID_NAME_REGEX }
   validates :family_name_kana, format: { with: VALID_KATAKANA_REGEX }
   validates :first_name_kana, format: { with: VALID_KATAKANA_REGEX }
   validates :birthday
  end

  has_many :items
  has_many :item_purchases
end
