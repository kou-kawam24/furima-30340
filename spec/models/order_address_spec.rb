require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入履歴の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入履歴が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '購入履歴が保存できない場合' do
      it 'postal_cordが空だと保存できないこと' do
        @order_address.postal_cord = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal cord can't be blank"
      end
      it 'postal_cordが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_cord = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal cord Input correctly'
      end
      it 'prefecture_idが{0}では保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Prefecture Select'
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numが空だと保存できないこと' do
        @order_address.phone_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone num can't be blank"
      end
      it 'phone_numに半角のハイフンを含めると保存できないこと' do
        @order_address.phone_num = '070-1111-2222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone num Input only number'
      end
      it 'phone_numが9桁以下では保存できないこと' do
        @order_address.phone_num = '555555555'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone num Input only number'
      end
      it 'phone_numが12桁以上では保存できないこと' do
        @order_address.phone_num = '555555555666'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone num Input only number'
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
