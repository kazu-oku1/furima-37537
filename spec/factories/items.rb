FactoryBot.define do
  factory :item do
    title { '靴' }
    explanation {Faker::Lorem.sentence}
    price { '1000' }
    category_id { '2' }
    condition_id { '3' }
    postage_type_id { '4' }
    prefecture_id { '5' }
    preparation_day_id { '6' }
    association :user
    # association :purchase

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
