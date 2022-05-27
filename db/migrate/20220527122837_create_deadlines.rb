# frozen_string_literal: true

class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.integer :min_space, null: false
      t.integer :max_space, null: false
      t.integer :days, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
