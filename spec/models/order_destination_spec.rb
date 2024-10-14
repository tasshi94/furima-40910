require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: @user.id, item_id: @item.id)
  end
  describe '配送先情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'shipping_from_idが---では保存できないこと' do
        @order_destination.shipping_from_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Shipping from can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @order_destination.street = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満保存できないこと' do
        @order_destination.phone_number = '123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが半角数値以外だと保存できないこと' do
        @order_destination.phone_number = '123-456-7890'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Input only numbers")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
