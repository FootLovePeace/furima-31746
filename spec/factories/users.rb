FactoryBot.define do
  factory :user do
    nickname              {"star"}
    email                 {"sss@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    last_name             {"星"}
    first_name            {"新一"}
    last_name_kana        {"ホシ"}
    first_name_kana       {"シンイチ"}
    birthday              {"1995-12-24"}
  end
end