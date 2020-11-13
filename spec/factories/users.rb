FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"000aaa"}
    password_confirmation {password}
    last_name             {"星"}
    first_name            {"新一"}
    last_name_kana        {"ホシ"}
    first_name_kana       {"シンイチ"}
    birthday              {"1995-12-24"}
  end
end