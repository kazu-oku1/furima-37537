FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'abc000' }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { 'たろう' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '20001201' }
  end
end
