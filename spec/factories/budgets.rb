# frozen_string_literal: true

FactoryBot.define do
  factory :budget do
    min_size { Faker::Number.decimal(l_digits: 2) }
    max_size { Faker::Number.decimal(l_digits: 2) }
    min_weight { Faker::Number.decimal(l_digits: 2) }
    max_weight { Faker::Number.decimal(l_digits: 2) }
    range_price { Faker::Number.decimal(l_digits: 2) }
    company
  end
end
