require 'rails_helper'

RSpec.describe RecordShipAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_ship_address = FactoryBot.build(:record_ship_address)
    @record_ship_address.user_id = user.id
    @record_ship_address.item_id = item.id
  end

  context '商品購入記録ができる場合' do
    it '商品購入記録が保存できる' do
      expect(@record_ship_address).to be_valid
    end

    it '建物名は空でも保存できる' do
      @record_ship_address.building = nil
      expect(@record_ship_address).to be_valid
    end
  end
  
  context '商品購入記録が保存できない場合' do
    it '購入者がいないと購入できない' do
      @record_ship_address.user_id = nil
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("User can't be blank")
    end

    it '購入商品がないと購入できない' do
      @record_ship_address.item_id = nil
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'tokenは空では購入できない' do
      @record_ship_address.token = nil
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が必須であること' do
      @record_ship_address.post_code = nil
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Post code can't be blank")
    end

    it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @record_ship_address.post_code = '1234567'
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Post code is invalid")
      @record_ship_address.post_code = '123-4567'
      expect(@record_ship_address).to be_valid
    end

    it '発送元の地域が選択されていない場合は保存されない' do
      @record_ship_address.prefecture_id = nil
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '都道府県は---登録できない' do
      @record_ship_address.prefecture_id = 1
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Prefecture can't be blank")
    end


    it '市区町村が必須であること' do
      @record_ship_address.municipalities = nil
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Municipalities can't be blank")
    end

    it '番地が必須であること' do
      @record_ship_address.address = nil
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Address can't be blank")
    end
 
    it '電話番号が必須であること' do
      @record_ship_address.telephone = nil
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Telephone can't be blank")
    end

    it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @record_ship_address.telephone = '123-4567'
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Telephone is invalid")
      @record_ship_address.telephone = '090123456789'
      @record_ship_address.valid?
      expect(@record_ship_address.errors.full_messages).to include("Telephone is invalid")
      @record_ship_address.telephone = '09012345678'
      expect(@record_ship_address).to be_valid
    end
  end
end