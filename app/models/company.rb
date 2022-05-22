# frozen_string_literal: true

class Company < ApplicationRecord
  validates :brand_name, :corporate_name, :registration_number,
            :address, :email_domain, :postal_code,
            :state_abbr, presence: true

  enum status: { active: 0, disabled: 1 }
end
