FactoryBot.define do
  factory :item do
    name                {"インテリア"}
    text                {"お洒落なインテリアです。"}
    price               {"5000"}
    category_id         {"5"}
    status_id           {"2"}
    shipping_fee_id     {"2"}
    shipping_region_id  {"27"}
    shipping_days_id    {"2"}

    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
