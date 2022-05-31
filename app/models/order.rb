# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :company
  has_one :pickup_location
  has_one :client

  enum status: { pending: 0, accepted: 1, collected: 2, in_transit: 3,
                 delivered: 4, cancelled: 5, delayed: 6 }

  before_validation :generate_code, on: :create

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end
end
