# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_30_185147) do
  create_table "budgets", force: :cascade do |t|
    t.decimal "min_size", null: false
    t.decimal "max_size", null: false
    t.decimal "min_weight", null: false
    t.decimal "max_weight", null: false
    t.decimal "range_price", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_budgets_on_company_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "city", null: false
    t.string "state_abbr", null: false
    t.string "district", null: false
    t.string "street", null: false
    t.string "number", null: false
    t.string "postal_code", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_clients_on_order_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.string "registration_number"
    t.string "address"
    t.string "email_domain"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state_abbr"
    t.integer "status", default: 0
  end

  create_table "deadlines", force: :cascade do |t|
    t.integer "min_space", null: false
    t.integer "max_space", null: false
    t.integer "days", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_deadlines_on_company_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "code", null: false
    t.string "product_code", null: false
    t.decimal "height", null: false
    t.decimal "width", null: false
    t.decimal "length", null: false
    t.decimal "weight", null: false
    t.decimal "space", null: false
    t.integer "status", default: 0
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_orders_on_company_id"
  end

  create_table "pickup_locations", force: :cascade do |t|
    t.string "city", null: false
    t.string "state_abbr", null: false
    t.string "district", null: false
    t.string "street", null: false
    t.string "number", null: false
    t.string "postal_code", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_pickup_locations_on_order_id"
  end

  create_table "shipping_custs", force: :cascade do |t|
    t.decimal "value", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_shipping_custs_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_model", null: false
    t.string "vehicle_make", null: false
    t.integer "load_capacity", null: false
    t.string "year", null: false
    t.string "vehicle_plate", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_vehicles_on_company_id"
  end

  add_foreign_key "budgets", "companies"
  add_foreign_key "clients", "orders"
  add_foreign_key "deadlines", "companies"
  add_foreign_key "orders", "companies"
  add_foreign_key "pickup_locations", "orders"
  add_foreign_key "shipping_custs", "companies"
  add_foreign_key "users", "companies"
  add_foreign_key "vehicles", "companies"
end
