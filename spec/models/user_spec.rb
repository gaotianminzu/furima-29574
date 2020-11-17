require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailが一意性があれば、登録できる' do
        @user.email = 'test@ttt.com'
        expect(@user).to be_valid
      end
      it 'emailが＠を含まれれば、登録できる' do
        @user.email = 'takada@test.com'
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば、登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば、登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it 'first_nameが全角（漢字）であれば登録できる' do
        @user.first_name = '明子'
        expect(@user).to be_valid
      end
      it 'first_nameが全角（ひらがな）であれば登録できる' do
        @user.first_name = 'あきこ'
        expect(@user).to be_valid
      end
      it 'first_nameが全角（カタカナ）であれば登録できる' do
        @user.first_name = 'アキコ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが 全角（カタカナ）であれば、登録できる。' do
        @user.first_name = 'タカダ'
        expect(@user).to be_valid
      end

      it 'last_nameが全角（漢字）であれば登録できる' do
        @user.last_name = '高田'
        expect(@user).to be_valid
      end
      it 'last_nameが全角（ひらがな）であれば登録できる' do
        @user.last_name = 'たかだ'
        expect(@user).to be_valid
      end
      it 'last_nameが全角（カタカナ）であれば登録できる' do
        @user.last_name = 'タカダ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが 全角（カタカナ）であれば、登録できる。' do
        @user.last_name = 'アキコ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid. Input half-width characters.')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana は全角カタカナで入力して下さい。')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'birth_dateが空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが＠が含まれなければ、登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid', 'Email に@が含まれていません。＠をいれてください。')
      end

      it 'Passwordが半角英数字混合でない場合(すべて半角数字）、登録できない。' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid. Input half-width characters.')
      end

      it 'Passwordが半角英数字混合でない場合(すべて半角小文字）、登録できない。' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid. Input half-width characters.')
      end
      it 'Passwordが半角英数字混合でない場合(全角混合）、登録できない。' do
        @user.password = 'あいうエオabc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid. Input half-width characters.')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'first_nameが全角ではない場合、登録できない（すべてローマ字）' do
        @user.first_name = 'akiko'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
      end
      it 'first_nameが全角ではない場合、登録できない（すべて半角カタカナ）' do
        @user.first_name = 'ｱｷｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
      end
      it 'first_nameが全角ではない場合、登録できない（全て数字）' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
      end
      it 'first_name_kanaが全角（カタカナ）ではない場合、登録できない（全てひらがな）' do
        @user.first_name_kana = 'あきこ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力して下さい。')
      end
      it 'first_name_kanaが全角（カタカナ）ではない場合、登録できない（全て漢字）' do
        @user.first_name_kana = '明子'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力して下さい。')
      end
      it 'first_name_kanaが 全角（カタカナ）ではない場合、登録できない（全て数字）' do
        @user.first_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力して下さい。')
      end

      it 'last_nameが全角ではない場合、登録できない（すべてローマ字）' do
        @user.last_name = 'takada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力してください。')
      end
      it 'last_nameが全角ではない場合、登録できない（すべて半角カタカナ）' do
        @user.last_name = 'ﾀｶﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力してください。')
      end
      it 'last_nameが全角ではない場合、登録できない（全て数字）' do
        @user.last_name = '456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力してください。')
      end
      it 'last_name_kanaが 全角（カタカナ）ではない場合、登録できない（全てひらがな）' do
        @user.last_name_kana = 'たかだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力して下さい。')
      end
      it 'last_name_kanaが 全角（カタカナ）ではない場合、登録できない（全て漢字）' do
        @user.last_name_kana = '高田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力して下さい。')
      end
      it 'last_name_kanaが 全角（カタカナ）ではない場合、登録できない（全て数字）' do
        @user.last_name_kana = '456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力して下さい。')
      end

    end
  end
end
