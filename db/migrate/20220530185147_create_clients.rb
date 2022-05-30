# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :full_name, null: false
      t.string :city, null: false
      t.string :state_abbr, null: false
      t.string :district, null: false
      t.string :street, null: false
      t.string :number, null: false
      t.string :postal_code, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
