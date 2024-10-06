require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報登録' do
    context '出品情報登録ができるとき' do
      it '適正に入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品情報登録ができないとき' do
      it 'imageが空では登録できない' do
        @item.image.purge
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが---では登録できない' do
        category = Category.find_by(name: '---')
        raise "Category with name '---' does not exist. Ensure the category exists in the ActiveHash data." unless category

        @item.category_id = category.id
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが---では登録できない' do
        condition = Condition.find_by(name: '---')
        raise "Condition with name '---' does not exist. Ensure the condition exists in the ActiveHash data." unless condition

        @item.condition_id = condition.id
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shipping_fee_idが---では登録できない' do
        shipping_fee = ShippingFee.find_by(name: '---')
        unless shipping_fee
          raise "ShippingFee with name '---' does not exist. Ensure the shipping_fee exists in the ActiveHash data."
        end

        @item.shipping_fee_id = shipping_fee.id
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it 'shipping_from_idが---では登録できない' do
        shipping_from = ShippingFrom.find_by(name: '---')
        unless shipping_from
          raise "ShippingFrom with name '---' does not exist. Ensure the shipping_from exists in the ActiveHash data."
        end

        @item.shipping_from_id = shipping_from.id
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping from can't be blank"
      end
      it 'shipping_day_idが---では登録できない' do
        shipping_day = ShippingDay.find_by(name: '---')
        unless shipping_day
          raise "ShippingDay with name '---' does not exist. Ensure the shipping_day exists in the ActiveHash data."
        end

        @item.shipping_day_id = shipping_day.id
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが数値でない場合登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceに全角数値が含まれる場合登録できない' do
        @item.price = '１234'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが9,999,999より大きい場合登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end
