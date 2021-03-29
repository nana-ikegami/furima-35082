FactoryBot.define do
  factory :order_address do
    post_code { '000-0000' }
    placeshipment_id { 2 }
    city { '港区' }
    address_number { '白金台2-6-10' }
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
    building_name { 'マンション名' }
  end
end
