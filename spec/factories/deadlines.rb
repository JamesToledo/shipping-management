# frozen_string_literal: true

FactoryBot.define do
  factory :deadline do
    min_space { Faker::Number.binary(digits: 3) }
    max_space { Faker::Number.binary(digits: 3) }
    days { Faker::Number.binary(digits: 1) }
    company
  end
end
