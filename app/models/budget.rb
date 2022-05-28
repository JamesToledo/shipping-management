# frozen_string_literal: true

class Budget < ApplicationRecord
  belongs_to :company

  validates :min_size, :max_size, :min_weight,
            :max_weight, :range_price, presence: true
end
