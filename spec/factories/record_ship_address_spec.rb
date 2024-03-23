FactoryBot.define do
  factory :record_ship_address do
    post_code { '123-4567' }
    prefectur_id { 2 }
    municipalities { '大阪' }
    address { '大阪市' }
    building { '第一ビル' }
    token { '12345abc' }
    telephone { '09012345678' }
  end
end
