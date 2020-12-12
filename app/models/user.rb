class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }, format: { with: /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/, message: 'に@が含まれていません。＠をいれてください。' }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :birth_date
  end

  has_many :items
  has_many :purchase_records
end
