# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    full_name { Faker::Name.name_with_middle }
    city { Faker::Address.city }
    state_abbr { Faker::Address.state_abbr }
    district { Faker::Address.community }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    postal_code { Faker::Address.zip_code }
    order
  end
end
