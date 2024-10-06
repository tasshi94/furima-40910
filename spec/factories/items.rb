FactoryBot.define do
  factory :item do
    item_name        { Faker::Lorem.sentence.truncate(40) }
    explanation      { Faker::Lorem.paragraphs(number: 50).join(" ")[0, 1000] }
    category_id      { Category.find_by(name: 'メンズ').id }
    condition_id     { Condition.find_by(name: '新品・未使用').id }
    shipping_fee_id  { ShippingFee.find_by(name: '着払い(購入者負担)').id }
    shipping_from_id { ShippingFrom.find_by(name: '北海道').id }
    shipping_day_id  { ShippingDay.find_by(name: '1~2日で発送').id }
    price            { rand(300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
