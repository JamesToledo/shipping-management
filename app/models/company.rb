# frozen_string_literal: true

class Company < ApplicationRecord
  validates :brand_name, :corporate_name, :registration_number,
            :address, :email_domain, :postal_code,
            :state_abbr, presence: true

  validates :registration_number, :email_domain, uniqueness: true

  validates :registration_number, length: { is: 14 }
  validates :postal_code, length: { is: 8 }

  enum status: { active: 0, disabled: 1 }

  has_many :vehicles
  has_many :budgets
  has_many :shipping_custs
  has_many :deadlines
  has_many :users
  has_many :orders
end
