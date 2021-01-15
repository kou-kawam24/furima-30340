require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context "出品商品が保存できる場合" do
      it "image、title、text、category_id、condition_id、
            shipping_fee、shipping_area、ship_date、priceがあれば保存できる" do
        expect(@item).to be_valid
      end
    end

    context "出品商品が保存できない場合" do
      it "imageが空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "titleが空では保存できない" do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it "textが空では保存できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it "category_idが{1}では保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it "condition_idが{1}では保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition Select'
      end
      it "shipping_feeが{1}では保存できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee Select"
      end
      it "shipping_areaが{0}では保存できない" do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping area Select'
      end
      it "ship_dateが{1}では保存できない" do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Ship date Select'
      end
      it "priceが空では保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "priceが半角数字以外では保存できない" do
        @item.price = '７７７７７'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number", "Price Out of setting range"
      end
      it "priceが入力範囲外では保存できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
    end
  end
end
