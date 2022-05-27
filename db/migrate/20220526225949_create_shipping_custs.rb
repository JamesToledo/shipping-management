# frozen_string_literal: true

class CreateShippingCusts < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_custs do |t|
      t.decimal :value, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
