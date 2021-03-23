require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nikcnameがない場合は登録できないこと" do
     user = build(:user, nickname: nil)
     user.valid?
     expect(user.errors[:nickname]).to include("を入力してください")
      # nicknameが空では登録できないテストコードを記述します
    end

    it "メールアドレスが必須であること" do
    end

    it "メールアドレスが一意性であること" do
    end

    it "メールアドレスは、@を含む必要があること" do
    end

    it "パスワードが必須であること" do
    end

    it "パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）" do
    end

    it "パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）" do
    end

    it "パスワードは、確認用を含めて2回入力すること" do
    end

    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
    end
  
  end
end
