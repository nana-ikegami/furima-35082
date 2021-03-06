require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # sleep(1)
  end
  describe '出品機能' do
    context '出品ができる時' do
      it '全ての情報が正しく入力されていれば、出品できること' do
        expect(@item).to be_valid
      end
    end
  end

  context '出品ができない時' do
    it '商品画像が必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it '商品の説明が必須であること' do
      @item.descuription = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Descuription can't be blank"
    end

    it 'カテゴリーが必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it '商品の状態が必須であること' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end

    it '配送料の負担が必須であること' do
      @item.postagetype_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Postagetype can't be blank"
    end

    it '発送元の地域が必須であること' do
      @item.placeshipment_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Placeshipment can't be blank"
    end

    it '発送までの日数が必須であること' do
      @item.preparationday_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Preparationday can't be blank"
    end

    it '販売価格が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it '販売価格が300円より上であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid'
    end

    it '販売価格が10000000円以下であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid'
    end

    it '販売価格が半角数字であること' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid'
    end

    it '全角文字では登録できないこと' do
      @item.price = 'アイウエオ'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid'
    end

    it '半角英数混合では登録できないこと' do
      @item.price = '123abc'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid'
    end

    it '半角英語だけでは登録できないこと' do
      @item.price = 'aiueo'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is invalid'
    end

    it "商品の状態で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Condition must be other than 1'
    end

    it "配送料の負担で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @item.postagetype_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Postagetype must be other than 1'
    end

    it "発送元の地域で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @item.placeshipment_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Placeshipment must be other than 1'
    end

    it "発送までの日数で{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @item.preparationday_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Preparationday must be other than 1'
    end

    it "カテゴリーで{ id: 1, name: '--' }が選択された時に登録できないこと" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category must be other than 1'
    end
  end
end
