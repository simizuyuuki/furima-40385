require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context '商品が出品できる場合' do
      it '商品が出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'userが紐付いていない場合は保存されない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像がない場合は保存されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が入力されていない場合は保存されない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '説明が入力されていない場合は保存されない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが選択されていない場合は保存されない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが(---)1の場合は保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '状態が選択されていない場合は保存されない' do
        @item.situation_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it 'situation_idが(---)1の場合は保存できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it '送料の負担が選択されていない場合は保存されない' do
        @item.charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it 'charge_idが1(---)の場合は保存できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it '発送元の地域が選択されていない場合は保存されない' do
        @item.prefectur_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectur can't be blank")
      end

      it 'prefectur_idが1(---)の場合は保存できない' do
        @item.prefectur_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectur can't be blank")
      end

      it '発送までの日数が選択されていない場合は保存されない' do
        @item.number_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Number can't be blank")
      end

      it 'number_idが1(---)の場合は保存できない' do
        @item.number_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Number can't be blank")
      end

      it '価格が入力されていない場合は保存されない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満の場合は保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9,999,999より大きい場合は保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが半角数字以外の場合は保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
