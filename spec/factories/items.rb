FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    shipping_area_id { 2 }
    ship_date_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
