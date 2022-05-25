# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_model, null: false
      t.string :vehicle_make, null: false
      t.integer :load_capacity, null: false
      t.string :year, null: false
      t.string :vehicle_plate, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
