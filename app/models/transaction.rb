class Transaction
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_place, :city_town_villages, :house_num, :building_name, :phone_number, :token, :cost

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_place, numericality: { other_than: 1, message: 'Select' }
    validates :city_town_villages
    validates :house_num
    validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'is invalid. Phone number Input only number' }
    validates :token
    validates :user_id
    validates :item_id
  end
  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, shipping_place: shipping_place, city_town_villages: city_town_villages, house_num: house_num, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
