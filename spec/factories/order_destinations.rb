FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    shipping_from_id { ShippingFrom.find(2).id }
    city { '東京都' }
    street { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { Faker::Number.leading_zero_number(digits: 10 + rand(2)) }
    association :user
    association :item
  end
end
