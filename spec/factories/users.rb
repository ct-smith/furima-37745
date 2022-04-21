FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(mix_case: true) }
    password_confirmation { password }
    first_name_kanji      { '太郎' }
    last_name_kanji       { '山田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
