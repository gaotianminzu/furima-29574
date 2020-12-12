FactoryBot.define do
  factory :user do
    id                    { 2 }
    nickname              { Gimei.last.hiragana }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
    first_name  { Gimei.first.kanji }
    last_name   { Gimei.last.kanji }
    first_name_kana  { Gimei.first.katakana }
    last_name_kana   { Gimei.last.katakana }
    birth_date { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
