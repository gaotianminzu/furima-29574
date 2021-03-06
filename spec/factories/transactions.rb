FactoryBot.define do
  factory :transaction do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '130-0030' }
    shipping_place_id { 2 }
    city_town_villages   { '墨田区' }
    house_num            { '青山１−１−１' }
    building_name        { 'ビルディング５F' }
    phone_number { '09000000000' }
  end
end
