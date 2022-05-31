# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :company
  has_one :order

  validates :vehicle_model, :vehicle_make, :load_capacity,
            :year, :vehicle_plate, presence: true
end
