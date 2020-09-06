FactoryBot.define do
  factory :purchase_address do

   token         { "000aaabbbb" }
   postal_code   { 123-4567 }
   prefecture_id { 2 }
   city          { "札幌市" }
   address       { "1-1" }
   telephone     { "09011111111" }

  end
end
