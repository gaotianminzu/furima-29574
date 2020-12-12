require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep(1)
  end

  describe '商品出品' do
    context '商品登録がうまくいくとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'costの範囲が、¥300~¥9,999,999の間であることば登録できる' do
        @item.cost = 9_999_999
        expect(@item).to be_valid
      end
      it 'costが半角数字であれば、登録できる' do
        @item.cost = 12_345
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'detailが空だと登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category Select')
      end

      it 'condition_idが空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition Select')
      end

      it 'shipping_fee_idが空だと登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank", 'Shipping fee Select')
      end
      it 'shipping_place_idが空だと登録できない' do
        @item.shipping_place_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping place can't be blank", 'Shipping place Select')
      end
      it 'shipping_days_idが空だと登録できない' do
        @item.shipping_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank", 'Shipping days Select')
      end
      it 'costが空だと登録できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank", 'Cost Half-width number', 'Cost is out of setting range')
      end

      it 'costが¥300~¥9,999,999以外(200の場合）だと登録できない' do
        @item.cost = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is out of setting range')
      end
      it 'costが¥300~¥9,999,999以外(1000000の場合）だと登録できない' do
        @item.cost = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is out of setting range')
      end
      it 'costが半角数字でない場合、登録できない' do
        @item.cost = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is out of setting range')
      end

      it 'category_idにid:1が選択されている場合に登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'condition_idにid:1が選択されている場合に登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it 'shipping_fee_idにid:1が選択されている場合に登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee Select')
      end
      it 'shipping_place_idにid:1が選択されている場合に登録できない' do
        @item.shipping_place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping place Select')
      end
      it 'shipping_days_idにid:1が選択されている場合に登録できない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping days Select')
      end
    end
  end
end
