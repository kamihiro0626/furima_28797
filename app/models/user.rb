class User < ApplicationRecord                       
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]\z/ }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/ }
  validates :password_confirmation, presence: true, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/ }
  validates :familyname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :familyname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
