FactoryBot.define do
  factory :user_address do
    address_line_1 { Faker::Address.street_address}
    address_line_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    country { Faker::Address.country_name_to_code(name: 'united_states') }
  end
end
