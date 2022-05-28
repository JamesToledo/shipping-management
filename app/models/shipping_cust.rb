# frozen_string_literal: true

class ShippingCust < ApplicationRecord
  belongs_to :company

  validates :value, presence: true
end
