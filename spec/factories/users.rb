FactoryBot.define do
  factory :user do
    nickname              {Gimei.last.hiragana}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name  {Gimei.first.kanji}
    last_name   {Gimei.last.kanji}
    first_name_kana  {Gimei.first.katakana}
    last_name_kana   {Gimei.last.katakana}
    birth_date  {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end


# FactoryBot.define do
#   factory :user do
#     nickname              {"たかだ"}
#     email                 {"kkk@gmail.com"}
#     password              {"123abc"}
#     password_confirmation {password}
#     first_name  {"明子"}
#     last_name   {"高田"}
#     first_name_kana  {"アキコ"}
#     last_name_kana   {"タカダ"}
#     birth_date  {2020-02-02}
#   end
# end