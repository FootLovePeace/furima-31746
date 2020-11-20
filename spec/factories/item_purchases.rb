FactoryBot.define do
  factory :item_purchase do
    postcode     {"123-4567"}
    region_id     {7}
    city          {"佐賀市"}
    block         {"南1-2"}
    building      {"北ビル101"}
    phone_number {"00000000000"}
  end
end
