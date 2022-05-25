# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    vehicle_model { Faker::Vehicle.model }
    vehicle_make { Faker::Vehicle.make }
    load_capacity { [1000, 2000, 3000, 4000].sample }
    year { Faker::Vehicle.year }
    vehicle_plate { Faker::Vehicle.license_plate }
  end
end
