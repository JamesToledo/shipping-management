# frozen_string_literal: true

FactoryBot.define do
  factory :shipping_cust do
    value { Faker::Number.decimal(l_digits: 2) }
    company
  end
end
