# frozen_string_literal: true

FactoryBot.define do
  factory :pickup_location do
    city { Faker::Address.city }
    state_abbr { Faker::Address.state_abbr }
    district { Faker::Address.community }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    postal_code { Faker::Address.zip_code }
    order
  end
end
