require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができるとき' do
      it '適正に入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordが英字のみの場合登録できない' do
      @user.password = 'pppppp'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password 英字と数字の両方を含めて設定してください'
    end
    it 'passwordが数字のみの場合登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password 英字と数字の両方を含めて設定してください'
    end
    it 'passwordに全角文字が含まれる場合登録できない' do
      @user.password = '１23456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password 英字と数字の両方を含めて設定してください'
    end
    it '姓が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank", 'Family name 全角文字（漢字・ひらがな・カタカナ）を使用してください'
    end
    it '名が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", 'First name 全角文字（漢字・ひらがな・カタカナ）を使用してください'
    end
    it '姓（カナ）が空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it '姓（カナ）がカタカナ以外では登録できない' do
      @user.family_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name kana 全角文字（カタカナ）を使用してください'
    end
    it '名（カナ）が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '名（カナ）がカタカナ以外では登録できない' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana 全角文字（カタカナ）を使用してください'
    end
    it '生年月日が空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end
    end
  end
end
