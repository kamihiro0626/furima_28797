FactoryBot.define do
  factory :item do
    name                   {"hiro"}
    content                {Faker::Lorem.sentence}
    category_id            {3}
    status_id              {4}
    shipping_fee_burden_id {2}
    shipping_origin_id     {4}
    shipping_days_id       {2}
    price                  {5000}
    user_id                {3}
    association :user
  end
end
