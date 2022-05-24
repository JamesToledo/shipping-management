# frozen_string_literal: true

class DropTableAdminUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table "admin_users", force: :cascade do |t|
      t.string "name", null: false
      t.string "surname", null: false
      t.string "email", null: false
      t.string "password", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
