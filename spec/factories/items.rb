FactoryBot.define do
  factory :item do
    name                  {'商品名'}
    price                 {300}
    category_id           {2}
    descuription          {'商品説明'}
    condition_id          {2}
    postagetype_id        {2}
    preparationday_id     {2}
    placeshipment_id      {2}
    association :user
  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end
