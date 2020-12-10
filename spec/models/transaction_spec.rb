require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '寄付情報の保存' do
    before do
      @transaction = FactoryBot.build(:transaction)
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
          @transaction.prefecture = ''
          @transaction.valid?
          expect(@transaction.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture Select')
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
        it '価格が空だと登録できない' do
          @transaction.cost = ''
          @transaction.valid?
          expect(@transaction.errors.full_messages).to include("Cost can't be blank")
        end
        it '電話番号が１２桁以上だと登録できない' do
          @transaction.phone_number = '000000000000'
          @transaction.valid?
          expect(@transaction.errors.full_messages).to include('Phone number is invalid. Phone number Input only number')
        end
        it '郵便番号にハイフンがない場合、登録できない' do
          @transaction.postal_code = '1111111'
          @transaction.valid?
          expect(@transaction.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end
      end
    end
  end
end
