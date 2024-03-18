FactoryBot.define do
  factory :user do
    # user factoryの定義
  end

  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    image { Faker::Internet.url }
    category_id { 2 }
    situation_id { 2 }
    charge_id { 2 }
    prefectur_id { 2 }
    number_id { 2 }
    price { 500 }

    association :user
  end
end
