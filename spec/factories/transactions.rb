FactoryBot.define do
  factory :transaction do
    user_id                   { 1 }
    item_id                   { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code          { '130-0030' }
    prefecture           { 2 }
    city_town_villages   { '墨田区' }
    house_num            { '青山１−１−１' }
    building_name        { 'ビルディング５F' }
    phone_number { '09000000000' }
  end
end
