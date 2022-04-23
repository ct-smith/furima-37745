FactoryBot.define do
  factory :item do
    name                { Faker::Name.initials(number: 3) }
    explanation         { Faker::Lorem.characters(number: 30) }
    category_id         { 2 }
    condition_id        { 2 }
    payer_id            { 2 }
    prefecture_id       { 2 }
    delivery_time_id    { 2 }
    price               { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
