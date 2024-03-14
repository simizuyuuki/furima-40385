require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it 'Git-Hubの指定通りのバリデーションができていたら登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")   
      end

      it 'first_nameは半角では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameは半角では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_huriganaが空では登録できない' do
        @user.first_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First hurigana can't be blank")
      end

      it 'first_huriganaは全角カタカナ以外は登録できない' do
        @user.first_hurigana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First hurigana can't be blank")
      end

      it 'last_huriganaが空では登録できない' do
        @user.last_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last hurigana can't be blank")
      end

      it 'last_huriganaは全角カタカナ以外は登録できない' do
        @user.last_hurigana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last hurigana can't be blank")
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは一意制でなければ登録できない' do
        existing_user = FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken") 
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは、5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
      end

      it 'passwordは、半角英数字混合でなければ登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword（確認用）は、値が一致しなければ登録できない' do
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
