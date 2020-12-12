require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @transaction = FactoryBot.build(:transaction, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '購入手続き' do
    context '購入がうまくいくとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@transaction).to be_valid
      end
      it '郵便番号は、ハイフンがあれば登録できる' do
        @transaction.postal_code = '111-1111'
        expect(@transaction).to be_valid
      end
      it '電話番号にはハイフン不要で１１桁以内であれば登録できる' do
        @transaction.phone_number = '00000000000'
        expect(@transaction).to be_valid
      end
      it '建物名が空でも登録できる' do
        @transaction.building_name = ''
        expect(@transaction).to be_valid
      end
    end
    context '購入がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @transaction.token = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと登録できない' do
        @transaction.postal_code = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと登録できない' do
        @transaction.shipping_place = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Shipping place can't be blank", 'Shipping place Select')
      end
      it '市町村が空だと登録できない' do
        @transaction.city_town_villages = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("City town villages can't be blank")
      end
      it '番地が空だと登録できない' do
        @transaction.house_num = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @transaction.phone_number = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid. Phone number Input only number')
      end
      it '電話番号が１２桁以上だと登録できない' do
        @transaction.phone_number = '000000000000'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Phone number is invalid. Phone number Input only number')
      end
      it '電話番号にハイフンがあると登録できない' do
        @transaction.phone_number = '000-0000-00000'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Phone number is invalid. Phone number Input only number')
      end
      it '郵便番号にハイフンがない場合、登録できない' do
        @transaction.postal_code = '1111111'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'user_idが空だと、登録できない' do
        @transaction.user_id = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと、登録できない' do
        @transaction.item_id = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Item can't be blank")
      end

      it '都道府県が１以外でないと、登録できない' do
        @transaction.shipping_place = 1
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Shipping place Select')
      end
      it '電話番号は数字のみでないと登録できない' do
        @transaction.phone_number = 'ああああああああ'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Phone number is invalid. Phone number Input only number')
      end
    end
  end
end
