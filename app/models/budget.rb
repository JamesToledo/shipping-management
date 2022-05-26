# frozen_string_literal: true

class Budget < ApplicationRecord
  belongs_to :company

  def row_generator(first, second)
    "#{first} a #{second}"
  end
end
