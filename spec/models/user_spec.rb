require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    # sleep(1)
  end
  describe '新規登録' do
    it "nikcnameがない場合は登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password"
    end

    it "パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）" do
      @user.password = 'ab1234'
      @user.password_confirmation = 'ab1234'
      expect(@user).to be_valid
    end

    it "パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
      @user.password = 'ab1234'
      @user.password_confirmation = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameがない場合は登録できないこと" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end

    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "family_name_kanaがない場合は登録できないこと" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end

    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
    end

    it 'family_nameが全角入力でなければ登録できないこと' do
      @user.family_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.family_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "生年月日が必須であること" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
  
    it "全ての情報が正しく入力されていれば、登録できること" do
      expect(@user).to be_valid
    end

  end
end
