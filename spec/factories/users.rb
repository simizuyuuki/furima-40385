FactoryBot.define do
  factory :user do
    password { 'test1111' }
    password_confirmation { password }
    first_name { 'テスト' }
    last_name { '太郎' }
    first_hurigana { 'テスト' }
    last_hurigana { 'タロウ' }
    nickname { 'テストタロウ' }
    sequence(:email) { |n| "test#{n}@gmail.com" }
    date_of_birth { '2000-03-01' }
  end
end
