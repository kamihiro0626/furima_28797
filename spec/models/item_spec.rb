require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create #update' do
    before do
      user = FactoryBot.create(:user)
      @item= FactoryBot.build(:item, user_id: user.id)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it "image,name,content,category_id,status_id,shipping_fee_burden_id,shipping_origin_id,shipping_days_id,price,user_idの値が存在すれば登録できること" do
      expect(@item).to be_valid
    end
    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を選択してください")
    end
    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it "contentが空では登録できないこと" do
      @item.content = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品説明を入力してください")
    end
    it "category_idが空では登録できないこと" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it "category_idが{ id: 1, name: '---' }のとき登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it "status_idが空では登録できないこと" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("ステータスを入力してください")
    end
    it "status_idが{ id: 1, name: '---' }のとき登録できないこと" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("ステータスを選択してください")
    end
    it "shipping_fee_burden_idが空では登録できないこと" do
      @item.shipping_fee_burden_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("配送負担を入力してください")
    end
    it "shipping_fee_burden_idが{ id: 1, name: '---' }のとき登録できないこと" do
      @item.shipping_fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送負担を選択してください")
    end
    it "shipping_origin_idが空では登録できないこと" do
      @item.shipping_origin_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("配送元を入力してください")
    end
    it "shipping_origin_idが{ id: 1, name: '---' }のとき登録できないこと" do
      @item.shipping_origin_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送元を選択してください")
    end
    it "shipping_day_idが空では登録できないこと" do
      @item.shipping_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("配送日数を入力してください")
    end
    it "shipping_day_idが{ id: 1, name: '---' }のとき登録できないこと" do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送日数を選択してください")
    end
    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("値段を入力してください")
    end
    it "priceが￥300~￥9,999,999の間でなければ登録できないこと"do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("値段は300以上の値にしてください")
    end
    it "priceが半角数字でない場合は登録することができない" do
      @item.price = "５５５５"
      @item.valid?
      expect(@item.errors.full_messages).to include("値段は数値で入力してください")
    end
  end
end
