FactoryBot.define do
  
  factory :user do
    nickname              {"kami"}             
    email                 {Faker::Internet.free_email}
    password              {"76jizou"}
    password_confirmation {"76jizou"}
    family_name           {"石田"}
    first_name            {"太郎"}
    family_name_kana      {"イシダ"}
    first_name_kana       {"タロウ"}
    birthday              {Faker::Date.birthday}
  end
end
