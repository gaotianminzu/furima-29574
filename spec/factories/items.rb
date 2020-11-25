FactoryBot.define do
  factory :item do
    name                      { Faker::Lorem.sentence }
    detail                    { Faker::Lorem.sentence }
    category_id               { 2 }
    condition_id              { 2 }
    shipping_fee_id           { 2 }
    shipping_place_id         { 2 }
    shipping_days_id          { 2 }
    cost                      { 10000 }
    user_id                   { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

    association :user
  end
end

# category_id               { id: 11, name: 'その他'},
# condition_id              { id: 2, name: '新品、未使用'}
# shipping_fee_id           { id: 2, name: '着払い(購入者負担)'},
# shipping_place_id         { id: 2, name: '北海道'},
# shipping_days_id          { id: 2, name: '1〜２日で発送'},
