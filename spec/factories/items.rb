FactoryBot.define do
  factory :item do
    name                      { Faker::Lorem.sentence }
    detail                    { Faker::Lorem.sentence }
    category_id               { 2 }
    condition_id              { 2 }
    shipping_fee_id           { 2 }
    shipping_place_id         { 2 }
    shipping_days_id          { 2 }
    cost                      { 10_000 }
    user_id                   { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

    association :user
  end
end
