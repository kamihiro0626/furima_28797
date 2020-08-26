require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item= FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it "image,name,content,category_id,status_id,shipping_fee_burden_id,shipping_origin_id,shipping_days_id,price,user_idの値が存在すれば登録できること" do
      expect(@item).to be_valid
    end
    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image cannot be blank")
    end
    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "contentが空では登録できないこと" do
      @item.content = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end
    it "category_idが空では登録できないこと" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "status_idが空では登録できないこと" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "shipping_fee_burden_idが空では登録できないこと" do
      @item.shipping_fee_burden_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
    end
    it "shipping_origin_idが空では登録できないこと" do
      @item.shipping_origin_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
    end
    it "shipping_days_idが空では登録できないこと" do
      @item.shipping_days_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end
    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが￥300~￥9,999,999の間でなければ登録できないこと"do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
  end
end
