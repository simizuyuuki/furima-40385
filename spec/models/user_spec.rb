require 'rails_helper'

RSpec.describe User, type: :model do
 describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
    it 'Git-Hubの指定通りのバリデーションができていたら登録できる' do
    end
  end
  contest '新規登録できないとき' do
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")   
    end
    it 'first_nameは半角では登録できない'
    @user.first_name = 'a'
    @user.valid?
    expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    it 'last_nameが空では登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last_name can't be blank")
    end
    it 'last_nameは半角では登録できない'
    @user.last_name = 'a'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last_name cant't be blank")
    end
    it 'fitst_huriganaが空では登録できない' do
    @user.first_hurigana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First_hurigana cant't be blank")
    end
    it 'first_huriganaは全角カタカナ以外は登録できない' do
    @user.first_hurigana = `あ`
    @user.valid?
    expect(@user.errors.full_messages).to include("First_hurigana cant't be blank")
    end
    it 'last_huriganaが空では登録できない' do
    @user.last_hurigana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last_hurigana cant't be blank")
    end
    it 'last_huriganaは全角カタカナ以外は登録できない' do
    @user.last_hurigana = 'あ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last_hurigana cant't be blank")
    end
    it 'nicnkameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it 'emailは一意制である' do
    end
    it 'imailは@を含まないと登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordは、5文字以下である' do
    end
    it 'passwordは、半角英数字混合である' do
    end
    it 'passwordとpassward（確認用）は、値が一致である' do
    end
    it 'date_of_birthが空では登録できない'do
    end
  end
end
