# frozen_string_literal: true

class PickupLocation < ApplicationRecord
  belongs_to :order
end
