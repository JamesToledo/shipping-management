# frozen_string_literal: true

class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.decimal :min_size, null: false
      t.decimal :max_size, null: false
      t.decimal :min_weight, null: false
      t.decimal :max_weight, null: false
      t.decimal :range_price, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
