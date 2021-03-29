require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user, email: 'test2@example' )
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
    sleep(1)
  end
  describe '商品購入機能' do
    context '購入ができる時' do
     it "全ての情報が正しく入力されていれば、購入できること" do
       expect(@order_address).to be_valid
     end

     it "建物名が空の場合でも保存できること" do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end

    end
  end

  context '購入ができない時' do
    it "user_idが必須であること" do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "User can't be blank"
    end

    it "item_idが必須であること" do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Item can't be blank"
    end

    it "郵便番号が必須であること" do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Post code can't be blank"
    end

    it "都道府県が必須であること" do
      @order_address.placeshipment_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Placeshipment can't be blank"
    end

    it "市区町村が必須であること" do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "City can't be blank"
    end

    it "番地が必須であること" do
      @order_address.address_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Address number can't be blank"
    end

    it "電話番号が必須であること" do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
    end

    it "tokenが必須であること" do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Token can't be blank"
    end

    it "郵便番号にハイフンがなければ登録できないこと" do
      @order_address.post_code = '0000000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Post code is invalid"
    end

    it "電話番号が11桁以内の数値のみであること" do
      @order_address.phone_number = '000000000000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Phone number is invalid"
    end

    it "電話番号は英数混合では登録できないこと" do
      @order_address.phone_number = '0000000000a'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Phone number is invalid"
    end

    it "都道府県で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @item.placeshipment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Placeshipment must be other than 1"
    end
  end
end
