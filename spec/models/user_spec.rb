require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

      it "nicknameとemail、passwordとpassword_confirmation、famiy_nameとfirst_name、family_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        it "emailの@が存在しない場合は登録できないこと" do
          @user.email = "kami.kami"
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        end
      it "重複したemailがある場合は登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
       expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが存在しても確認用がなければ登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが6文字以上であれば登録できること" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "passwordが5文字以下であれば登録できないこと" do  
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが半角英数字混合でなければ登録できないこと" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "ユーザー本名の名字が空では登録できないこと" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it "ユーザー本名の名前が空では登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "ユーザー本名が半角であれば登録できないこと" do
        @user.family_name = "takahashi"
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です")
      end
      it "ユーザー本名のフリガナの名字が空では登録できないこと" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（フリガナ）を入力してください")
      end
      it "ユーザー本名のフリガナの名前が空では登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（フリガナ）を入力してください")
      end
      it "ユーザー本名のフリガナが半角（カタカナ）であれば登録できないこと" do
        @user.family_name_kana = "ﾀｶﾊｼ"
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（フリガナ）は不正な値です")
      end
      it "生年月日がなければ登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
  end
end