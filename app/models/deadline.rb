# frozen_string_literal: true

class Deadline < ApplicationRecord
  belongs_to :company

  validates :min_space, :max_space, :days, presence: true
end
