# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :code, null: false
      t.string :product_code, null: false
      t.decimal :height, null: false
      t.decimal :width, null: false
      t.decimal :length, null: false
      t.decimal :weight, null: false
      t.decimal :space, null: false
      t.integer :status, default: 0
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
