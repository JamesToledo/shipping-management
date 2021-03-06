# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    brand_name { Faker::Commerce.brand }
    corporate_name { Faker::Company.name }
    registration_number { Faker::Company.brazilian_company_number }
    email_domain { Faker::Internet.domain_name }
    address { Faker::Address.street_address }
    state_abbr { Faker::Address.state_abbr }
    postal_code { %w[12421570 65063580 68909464].sample }
  end
end
