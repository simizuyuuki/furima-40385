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
  end

  it '購入者がいないと購入できない' do
    @record_ship_address.user_id = nil
    expect(@record_ship_address).not_to be_valid
  end

  it '購入商品がないと購入できない' do
    @record_ship_address.item_id = nil
    expect(@record_ship_address).not_to be_valid
  end

  it 'tokenは空では購入できない' do
    @record_ship_address.token = nil
    expect(@record_ship_address).not_to be_valid
  end

  it '郵便番号が必須であること' do
    @record_ship_address.post_code = nil
    expect(@record_ship_address).not_to be_valid
  end

  it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
    @record_ship_address.post_code = '1234567'
    expect(@record_ship_address).not_to be_valid
    @record_ship_address.post_code = '123-4567'
    expect(@record_ship_address).to be_valid
  end

  it '都道府県が必須であること' do
    @record_ship_address.prefectur_id = nil
    expect(@record_ship_address).not_to be_valid
  end

  it '都道府県は---登録できない' do
    @record_ship_address.prefectur_id = 1
    expect(@record_ship_address).not_to be_valid
  end

  it '市区町村が必須であること' do
    @record_ship_address.municipalities = nil
    expect(@record_ship_address).not_to be_valid
  end

  it '番地が必須であること' do
    @record_ship_address.address = nil
    expect(@record_ship_address).not_to be_valid
  end

  it '建物名は任意であること' do
    @record_ship_address.building = nil
    expect(@record_ship_address).to be_valid
  end

  it '電話番号が必須であること' do
    @record_ship_address.telephone = nil
    expect(@record_ship_address).not_to be_valid
  end

  it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
    @record_ship_address.telephone = '123-4567'
    expect(@record_ship_address).not_to be_valid
    @record_ship_address.telephone = '090123456789'
    expect(@record_ship_address).not_to be_valid
    @record_ship_address.telephone = '09012345678'
    expect(@record_ship_address).to be_valid
  end
end
