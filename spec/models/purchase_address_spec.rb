require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it "すべての値が正しく入力されていれば保存できること" do
      expect(@purchase_address).to be_valid
    end
    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it  "potal_codeが空だと登録できないこと" do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it  "postal_codeはハイフンがないと登録できないこと" do
      @purchase_address.postal_code = 1234567
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it  "prefecture_idが空だと登録できないこと" do
      @purchase_address.prefecture_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it  "cityが空だと登録できないこと" do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it  "addressが空だと登録できないこと" do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it  "telephoneが空だと登録できないこと" do
      @purchase_address.telephone = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
    end
    it  "telephoneがハイフンありだと登録できないこと" do
      @purchase_address.telephone = "090-1111-1111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
    end
    it  "telephoneが11文字以上だと登録できないこと" do
      @purchase_address.telephone = "090111111111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
    end
  end
end
