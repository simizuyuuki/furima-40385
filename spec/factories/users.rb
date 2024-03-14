FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "Password1" }  
    password_confirmation { "Password1" }  
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    first_hurigana        { "タロウ" }  
    last_hurigana         { "ヤマダ" }  
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 65) } 
  end
end