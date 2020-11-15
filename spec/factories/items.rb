FactoryBot.define do
  factory :item do
    name         {Faker::Name.name}
    description  {Faker::Lorem.sentence}
    category_id  {2}
    status_id    {3}
    postage_id   {2}
    region_id    {5}
    ship_date_id {3}
    price        {1000} 
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
