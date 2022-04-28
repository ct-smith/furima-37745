FactoryBot.define do
  factory :purchase_address do
    postal_code      { '111-1111' }
    prefecture_id    { 2 }
    city             { '東京都' }
    phone_number     { '09012345678' }
    building         { '東京ハイツ' }
    address_line     { '青山1-1' }
    
  end
end
