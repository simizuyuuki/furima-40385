FactoryBot.define do
  factory :item do
    name { 'test' }
    description { 'test' }
    category_id { 2 }
    situation_id { 2 }
    charge_id { 2 }
    prefectur_id { 2 }
    number_id { 2 }
    price { 500 }

    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/logo.png.png'), filename: 'logo.png.png')
    end
  end
end
