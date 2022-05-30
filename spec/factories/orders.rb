# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    product_code { Faker::Alphanumeric.alpha(number: 8).upcase }
    weight { Faker::Number.decimal(l_digits: 2) }
    height { Faker::Number.decimal(l_digits: 2) }
    width { Faker::Number.decimal(l_digits: 2) }
    length { Faker::Number.decimal(l_digits: 2) }
    space { Faker::Number.binary(digits: 3) }
    company
  end
end
