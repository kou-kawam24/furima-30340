FactoryBot.define do
  factory :order_address do
    postal_cord { '123-4567' }
    prefecture_id { 1 }
    city { '愛知県' }
    address { '5-5-5' }
    building { '名古屋ビル' }
    phone_num { Faker::Number.number(digits: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
